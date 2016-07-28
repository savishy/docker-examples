#!/bin/bash

command -v docker-machine >/dev/null 2>&1 || { echo "I require docker-machine but it's not installed.  Aborting." >&2; exit 1; }

echo "-- removing existing Docker Machines ..."
docker-machine ls
docker-machine rm swarm-manager
docker-machine rm swarm-worker1
docker-machine rm swarm-worker2

SWARM_CLUSTER_TOKEN=$(docker run swarm create)
provider="virtualbox"
echo "-- Swarm Token: $SWARM_CLUSTER_TOKEN"

COMMON_ARGS="-d $provider --swarm --swarm-discovery token://$SWARM_CLUSTER_TOKEN"
docker-machine create $COMMON_ARGS --swarm-master swarm-manager
docker-machine create $COMMON_ARGS swarm-worker1
docker-machine create $COMMON_ARGS swarm-worker2


