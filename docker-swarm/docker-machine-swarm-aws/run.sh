#!/bin/bash
# ref:
# http://blog.scottlowe.org/2016/03/25/docker-swarm-aws-docker-machine/
# https://docs.docker.com/machine/drivers/aws/
# https://docs.docker.com/swarm/provision-with-machine/

set -e
COMMON_OPTS=" --amazonec2-region ap-southeast-1 --amazonec2-zone a --amazonec2-vpc-id vpc-6a28970f \
--amazonec2-security-group vish_agility_aws "

docker-machine rm -f tokenserver
docker-machine rm -f manager0
docker-machine rm -f worker0
docker-machine rm -f worker1

echo "---- creating swarm token server"
docker-machine create -d amazonec2 $COMMON_OPTS tokenserver
eval $(docker-machine env tokenserver)
swarm_token=$(docker run swarm create)
echo "-- swarm token is $swarm_token"
SWARM_OPTS=" --swarm --swarm-discovery token://${swarm_token} "
echo "---- creating swarm manager"
docker-machine create -d amazonec2 \
               $COMMON_OPTS \
               $SWARM_OPTS \
               --swarm-master \
               manager0

echo "---- creating swarm workers"

docker-machine create -d amazonec2 \
               $COMMON_OPTS \
               $SWARM_OPTS \
               worker0
docker-machine create -d amazonec2 \
               $COMMON_OPTS \
               $SWARM_OPTS \
               worker1
docker-machine ls

echo "---- to connect to the swarm manager, we will run the following: \
eval $(docker-machine env --swarm manager0)"
eval $(docker-machine env --swarm manager0)

echo "---- now we run a sample Nginx application on manager0"
docker run -d -p 8080:80 nginx:latest

echo "---- the container has been started. details of the worker where its running are printed below:"
docker ps -a

MANAGER0_IP=$(docker-machine inspect manager0 -f "{{ .Driver.IPAddress }}")
echo "---- manager0 IP address is at $MANAGER0_IP. "
