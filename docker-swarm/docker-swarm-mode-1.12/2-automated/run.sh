#!/bin/bash
set -e

# driver. change to amazonec2 to create this in cloud.
DRIVER="virtualbox"

# common amazon ec2 options
if [[ "$DRIVER" == "amazonec2" ]]; then
    COMMON_OPTS=" --amazonec2-region ap-southeast-1 --amazonec2-zone a --amazonec2-vpc-id vpc-6a28970f \
--amazonec2-security-group vish_agility_aws "
else
    COMMON_OPTS=""
fi

# remove previous machines. 
docker-machine rm -f manager0
docker-machine rm -f worker0
docker-machine rm -f worker1

echo "---- creating docker machines manager0, worker0, worker1"
docker-machine create -d $DRIVER $COMMON_OPTS manager0
docker-machine create -d $DRIVER $COMMON_OPTS worker0
docker-machine create -d $DRIVER $COMMON_OPTS worker1


eval $(docker-machine env manager0)
# get ip of manager0
MANAGER0_IP=$(docker-machine ip manager0)
echo "---- creating swarm manager; machine ip $MANAGER0_IP"
docker swarm init --advertise-addr $MANAGER0_IP

# get manager and worker tokens
MANAGER_TOKEN=$(docker swarm join-token -q manager)
WORKER_TOKEN=$(docker swarm join-token -q worker)

WORKER_JOIN_CMD="docker swarm join --token $WORKER_TOKEN $MANAGER0_IP:2377"

echo "---- joining worker0, worker1 to swarm"
eval $(docker-machine env worker0)
eval $WORKER_JOIN_CMD
eval $(docker-machine env worker1)
eval $WORKER_JOIN_CMD
