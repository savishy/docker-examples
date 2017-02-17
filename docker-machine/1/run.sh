#!/bin/bash
set -e
command -v docker-machine >/dev/null 2>&1 || { echo "I require docker-machine but it's not installed.  Aborting." >&2; exit 1; }

machineName="docker-swarm-manager"
provider="virtualbox"
echo "--deleting previous Docker Machines named $machineName
(please answer y or n)
"
docker-machine rm $machineName

echo "--creating Docker Machine $machineName"
docker-machine create -d $provider $machineName

echo "--connecting to Docker Machine $machineName"
eval $(docker-machine env $machineName)

echo "--verifying that we are connected ... "
machineNameActual=$(docker info | grep -oP "(?<=Name:\s).*")

if [[ ! "$machineNameActual" == "$machineName" ]]; then
    echo "actual machine name: $machineNameActual
expected machine name: $machineName
Error: Connecting to machine appears to have failed!"
    exit 1;
fi

echo "--running an nginx web-server inside machine $machineName"
docker run -d -p 80:80 nginx:latest

dockerMachineIp=$(docker-machine ip $machineName)

echo "--Open the following in a browser to access your Nginx Web Server:"
echo "------"
echo "http://$dockerMachineIp:80"
echo "------"
