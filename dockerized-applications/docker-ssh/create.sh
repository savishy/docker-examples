#!/bin/bash
set -e
# do not prompt http://stackoverflow.com/a/15890748/682912
echo "-- creating an SSH key without passphrase (NOT FOR PRODUCTION)"
echo -e  'n\n' | ssh-keygen -b 2048 -t rsa -f ./ansible_id_rsa -q -N ""
chmod 600 ansible_id_rsa
echo "-- creating Docker Image"
docker build -t docker-ssh .
