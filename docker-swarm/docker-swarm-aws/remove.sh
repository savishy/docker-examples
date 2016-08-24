#!/bin/sh
# takes one argument: name of container.
containers=$(docker ps -aq --filter "name=$1")
for i  in $containers; do
    docker stop $i
    docker rm $i
done
