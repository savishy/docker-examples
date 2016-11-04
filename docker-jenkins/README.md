# Docker + Jenkins

## Introduction

This example Dockerizes Jenkins. Several concepts are illustrated here:
* using an official image to get started faster
* Copying files over to the image
* Customizing the Jenkins with our specific settings.

These points help us move toward creating idempotent containers; i.e
* This Jenkins image will create containers that contain the exact configuration you want, every time.

## How to run

* Execute script `build.sh` to build Jenkins image.
* Execute script `run.sh` to start Jenkins container.

Load `localhost:9091` in a browser to load your customized jenkins.


Look at the scripts for details.

## Notes

### Port, Jenkins Home etc.

By default this Jenkins instance uses port 9091 to avoid conflicting with any other applications using 8080. You can customize this in the dockerfile.

The Jenkins Home directory is a local folder that's bind-mounted to the container directory.

### Plugin list
This Jenkins loads with a large set of plugins preinstalled. This list of plugins is maintained in a file `plugins.txt`. You can customize the list as you want. For details see http://hub.docker.com/_/jenkins/

### Works with Cygwin + Windows as well
I have tested this out on Cygwin + Windows + Docker Toolbox as well.

**Windows-specific Note!!!**

If you are trying this out on Windows, what Jenkins IP Address would you type in address bar?
*The IP Address of the Docker Machine.*
