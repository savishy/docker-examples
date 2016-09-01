#!/bin/sh
# takes one argument: name of container.
containers=$(docker ps -aq --filter "name=$1")
for i in $containers; do
    echo "-- remove container $i"
    docker stop $i
    docker rm $i
done
