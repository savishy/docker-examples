#!/bin/bash
set -e
# reference: https://github.com/sorccu/docker-adb

mntarg=""
if [[ "$1" == "" ]]; then
    echo "-- no local folder provided, not mounting anything"
else
    if [[ -d "$1" ]]; then
        echo "-- $1 will be mounted into container"
        mntarg=" -v $1:$1"
    else
        echo "-- warn: $1 does not exist; skipping"
    fi
fi

# if adb server is running on host, it won't work in docker container.
echo "-- killing adb server on host"
adb kill-server

# check whether adb server container is running
op=`docker ps -q --filter name=adbd | wc -l`
if [[ $op -eq 1 ]]; then
    echo "-- adb server container already running; reusing container..."
else
    echo "-- adb server container not running; starting container..."
    # run adb server container
    docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb --name adbd sorccu/adb
fi

# start our container 
echo "-- start calabash container..."
docker run -it --net container:adbd $mntarg calabash-android
