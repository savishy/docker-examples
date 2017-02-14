# Docker + Ubuntu + Supervisor

## Introduction

The [Ubuntu + Apache](https://github.com/savishy/docker-examples/tree/master/docker-ubuntu-apache) example was a decent way to start Apache, but what if you want to start multiple processes?

This example starts an Apache server and SSH server in a single container. Even if you are only launching a single process, Supervisor is a better alternative than using `CMD`.

## How to run

To run this example:

First build the image and run a named container from it.

```
docker build -t docker-ubuntu-supervisor .
docker run -p 8080:8080 -p 22:22 --name docker-supervisor-container docker-ubuntu-supervisor
```

## Accessing the web server

Now you can access the sample web server by typing the container's IP Address
in a browser.

To find out the container's IP Address you can type:

```
docker inspect --format "{{ .NetworkSettings.IPAddress }}" docker-supervisor-container
```

## Notes

We have started an SSH server as well. But I am not going to demonstrate how to SSH into this running container.
The reason is that:
* A container is supposed to be a dedicated microservice. Running an SSH server defeats the purpose of having a lean, "micro" service.
* Monitoring processes within a running container is easily achieved with `docker logs` and `docker exec`.
* In case you do need to open a terminal into the container, `docker exec -it container-name bash` works great.
