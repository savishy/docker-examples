#!/bin/bash
echo "-- removing previous loadbalancer containers"
docker ps -aq -f "ancestor=haproxy-swarm" | xargs docker rm -f
echo "-- building loadbalancer image"
docker build -t haproxy-swarm lb-static/
echo "-- running loadbalancer container"
docker run -d -p 80:80 --name haproxy-swarm-container haproxy-swarm
