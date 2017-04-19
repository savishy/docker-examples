#!/bin/bash
set -e

log() {
  GREEN='\033[0;32m'
  NC='\033[0m' # No Color
  printf "${GREEN}--- $1${NC}\n"
}

logError() {
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  printf "${RED}--- $1${NC}\n"
}

log "--------------------------------"
log "SWARM CREATION SCRIPT"
log "(to be run from Cygwin or Docker Quickstart Terminal)"
log "Usage:"
log "$0 :  create docker swarm using virtualbox VMs"
log "$0 amazonec2: create swarm in Amazon AWS"
log "-------------------------------"

if [[ "$#" == 0 ]]; then
  DRIVER="virtualbox"
else
  DRIVER=$1
fi

doAWSChecks() {
  log "-- initial checks..."
  errors=false
  for var in  AWS_ACCESS_KEY \
              AWS_SECRET_KEY \
              AWS_VPC_ID \
              AWS_DEFAULT_REGION \
              AWS_KEYPAIR_NAME \
              AWS_SSH_KEYPATH \
              AWS_DEFAULT_ZONE \
              AWS_SECURITYGROUP; do
    if [[ "${!var}" == "" ]]; then
      logError "ERROR: $var is not set! Did you set the variable in setenv.sh?"
      errors=true
    fi
  done
  if $errors; then
    logError "Please fix the above errors and try again" \
    && exit 1
  fi
}

# common amazon ec2 options
if [[ "$DRIVER" == "amazonec2" ]]; then
    . setenv.sh
    doAWSChecks
    COMMON_OPTS=" --amazonec2-region $AWS_DEFAULT_REGION \
                  --amazonec2-zone $AWS_DEFAULT_ZONE \
                  --amazonec2-vpc-id $AWS_VPC_ID \
                  --amazonec2-keypair-name $AWS_KEYPAIR_NAME \
                  --amazonec2-ssh-keypath $AWS_SSH_KEYPATH \
                  --amazonec2-security-group $AWS_SECURITYGROUP "
elif [[ "$DRIVER" == "virtualbox" ]]; then
    COMMON_OPTS=""
else
  logError "unsupported driver: $DRIVER" && exit 1
fi

log "---- using driver $DRIVER"

for machineName in manager0 worker0 worker1; do
  # remove previous machines.
  log "---- removing previous docker-machine $machineName"
  docker-machine rm -f $machineName
  log "---- creating docker machine $machineName"
  docker-machine create -d $DRIVER $COMMON_OPTS $machineName
done

eval $(docker-machine env manager0)
# get ip of manager0
MANAGER0_IP=$(docker-machine ip manager0)
log "---- creating swarm manager; machine ip $MANAGER0_IP"
docker swarm init --advertise-addr $MANAGER0_IP

# get manager and worker tokens
MANAGER_TOKEN=$(docker swarm join-token -q manager)
WORKER_TOKEN=$(docker swarm join-token -q worker)

WORKER_JOIN_CMD="docker swarm join --token $WORKER_TOKEN $MANAGER0_IP:2377"

log "---- joining worker0, worker1 to swarm"
eval $(docker-machine env worker0)
eval $WORKER_JOIN_CMD
eval $(docker-machine env worker1)
eval $WORKER_JOIN_CMD
