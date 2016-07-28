#!/bin/sh

containers=$(docker ps -aq --filter "name=consul")
for i  in $containers; do
    docker stop $i
    docker rm $i
done
