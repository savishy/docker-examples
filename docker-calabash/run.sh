#!/bin/bash
# https://github.com/sorccu/docker-adb
# if adb server is running on host, it won't work in docker container.
adb kill-server

# run adb server container
docker run --rm -d --privileged -v /dev/bus/usb:/dev/bus/usb --name adbd sorccu/adb

# start our container 
docker run --rm -it --net container:adbd calabash-android
