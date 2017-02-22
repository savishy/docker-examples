#!/bin/bash
set -e
# do not prompt http://stackoverflow.com/a/15890748/682912
CONTAINER_NAME=docker-ssh-container
IMG_NAME=docker-ssh
KEY_NAME=ansible_id_rsa
KEY_PATH="~/.ssh/$KEY_NAME"
echo "-- cleaning up past containers"
prevContainers=`docker ps -aq -f "ancestor=$IMG_NAME"`
if [[ ! "$prevContainers" == "" ]]; then
  echo $prevContainers | xargs docker rm -f
fi

echo "-- creating SSH key $KEY_PATH  (Warning: this step may fail during repeated runs -- WIP)"
if [ ! -e $KEY_PATH ]; then
  ssh-keygen -b 2048 -t rsa -f $KEY_PATH -q -N ""
fi

cp -v $KEY_PATH .
cp -v $KEY_PATH.pub .
echo "-- creating Docker Image"
docker build -t $IMG_NAME .
chmod 600 $KEY_PATH
chmod 600 $KEY_PATH.pub

echo "-- running Docker container"
docker run -d -p 2200:22 --name $CONTAINER_NAME $IMG_NAME

ipAddr=`docker inspect -f {{.NetworkSettings.IPAddress}} $CONTAINER_NAME`
echo "-- container IP: $ipAddr"
echo "-- removing any old entries from known_hosts"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R $ipAddr

echo "-- creating inventory file (for use by Ansible)"
commonArgs="ansible_ssh_port=22 ansible_ssh_user='root' ansible_ssh_private_key_file=$KEY_PATH"
inventoryLine="$CONTAINER_NAME ansible_ssh_host=$ipAddr $commonArgs"
echo "$inventoryLine" > inventory
