#!/bin/bash
set -e
# do not prompt http://stackoverflow.com/a/15890748/682912
echo "-- creating an SSH key without passphrase (NOT FOR PRODUCTION)"
if [ ! -e ~/.ssh/ansible_id_rsa ]; then
  ssh-keygen -b 2048 -t rsa -f ~/.ssh/ansible_id_rsa -q -N ""
fi
cp -v ~/.ssh/ansible_id_rsa* .
echo "-- creating Docker Image"
docker build -t docker-ssh .
chmod 600 ~/.ssh/ansible_id_rsa
chmod 600 ~/.ssh/ansible_id_rsa.pub

echo "-- removing any old entries from known_hosts"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R 172.17.0.2

echo "-- running Docker container"
docker run -d -p 2200:22 --name docker-ssh-container docker-ssh
