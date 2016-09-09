# docker-examples
This is a repository of simple Docker examples.

Videos accompanying this code repo can be found in [this YouTube playlist](https://www.youtube.com/playlist?list=PL5f2nDQavqSKSqrptqolPZTxa9LGsRzG9).

## Prerequisites

Any machine with a working docker installation *Should* suffice; however individual examples may have other requirements.

Most of these examples have been tested out on Ubuntu 16.04 + Docker.
Some have additionally been tested on Windows 10 + Docker Toolbox.

### Examples
The examples are arranged below in increasing order of difficulty.

#### Beginner: [docker-whale](https://github.com/savishy/docker-examples/tree/master/docker-whale)
This Simple example is from the [Docker Getting Started Guide.](https://docs.docker.com/engine/getstarted/step_three/)

#### Beginner: [docker-ubuntu-fortunes](https://github.com/savishy/docker-examples/tree/master/docker-ubuntu-fortunes)
This example uses Ubuntu + the `fortunes` package.

#### Beginner: [docker-ubuntu-apache](https://github.com/savishy/docker-examples/tree/master/docker-ubuntu-apache)
Here we will build an Apache Web Server using Ubuntu + Apache.

#### Beginner: docker-ubuntu-supervisor
This example shows how to build the same Apache webserver using `supervisor`. Additionally we will launch an SSH server (so that you can ssh to this webserver).

#### Beginner: docker-jenkins

This example Dockerizes Jenkins.
