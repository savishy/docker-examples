This is a simple script to demonstrate the Docker Machine Example in the
[docker machine guide](https://docs.docker.com/machine/get-started/).

The script

* deletes existing docker machines
* creates a docker machine
* connects to it
* pulls `nginx` image and runs a web server
* extracts the docker machine's IP address
* prints out the address of the running web server.

## Note!

*Do not run the script inside virtualbox!*

The script is tested only for use within the following environment
* Windows + Cygwin
* Docker Toolbox installed on Windows

Do not run the script within a virtualized environment ie. within a virtualbox VM.
