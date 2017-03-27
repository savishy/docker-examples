#!/bin/bash
set -e
# do not prompt http://stackoverflow.com/a/15890748/682912
CONTAINER_NAME=docker-ssh-container
IMG_NAME=docker-ssh
KEY_NAME=ansible_id_rsa
KEY_PATH="~/.ssh/$KEY_NAME"

usage() {
  echo "
  This script creates a Docker container with ability to SSH into it.
  ** Note ** when running for the first time, use the -r flag (see below).
  Usage: $0 [OPTS]

  OPTS:
  -h | -?: print this usage and exit.

  -r: During the first run of this script, use this flag. This generates SSH keys.

  -p: Specify a list of ports to forward from host into the container. Format is
      -p P1:P1,P2:P2,....

  "
}
####
# Parse commandline args
####
while getopts "h?rp:" opt; do
    case "$opt" in
    h|\?)
        usage
        exit 0
        ;;
    r)  regenssh=1
        ;;
    p)  port_list=$OPTARG
        ;;
    esac
done

echo "-- cleaning up past containers"
prevContainers=`docker ps -aq -f "ancestor=$IMG_NAME"`
if [[ ! "$prevContainers" == "" ]]; then
  echo $prevContainers | xargs docker rm -f
fi

if [[ $regenssh ]]; then
  echo "-- creating SSH key $KEY_PATH"
  echo "** Warning **: this step may fail during repeated runs -- WIP"
  if [ ! -e $KEY_PATH ]; then
    ssh-keygen -b 2048 -t rsa -f $KEY_PATH -q -N ""
  else
    echo "-- key exists at $KEY_PATH; skipping"
  fi
  cp -v $KEY_PATH .
  cp -v $KEY_PATH.pub .
  chmod 600 $KEY_PATH
  chmod 600 $KEY_PATH.pub
else
  echo "-- skipping SSH key creation at $KEY_PATH (run the script with $0 true to enable this)"
fi

echo "-- creating Docker Image"
docker build -t $IMG_NAME .

IFS=',' read -ra PORTS <<< "$port_list"
portForwards="-p 2200:22"
for i in "${PORTS[@]}"; do
    portForwards="$portForwards -p $i "
done

echo "-- Ports to Forward: $portForwards"
echo "-- running Docker container"
set -x
docker run -m "2048m" --memory-swap "4096m" -d $portForwards --name $CONTAINER_NAME $IMG_NAME
set +x
CONTAINER_ID=`docker ps -aq -f "name=$CONTAINER_NAME"`
ipAddr=`docker inspect -f {{.NetworkSettings.IPAddress}} $CONTAINER_NAME`
echo "-- container IP: $ipAddr"
echo "-- removing any old entries from known_hosts"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R $ipAddr

echo "-- creating inventory file (for use by Ansible)"
commonArgs="ansible_ssh_port=22 ansible_ssh_user='root' ansible_ssh_private_key_file=$KEY_PATH"
inventoryLine="$CONTAINER_NAME ansible_ssh_host=$ipAddr $commonArgs"
echo "$inventoryLine" > inventory
echo "--------------------------"
echo "-- inventory file created at ./inventory"
echo "-- docker container created with name $CONTAINER_NAME"
echo "   and ID: $CONTAINER_ID"
echo "-- To SSH into this container, do the following: "
echo "   ssh -i $KEY_PATH root@$ipAddr"
echo "--------------------------"
