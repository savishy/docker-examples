#!/bin/bash
echo "mounting local folder as data volume"
set -x
docker run -v /home/vish/Downloads:/tmp  -it ubuntu
set +x
