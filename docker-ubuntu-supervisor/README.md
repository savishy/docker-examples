This example starts an Apache server and SSH server in a single container.

To run this example:

First build the image and run a named container from it.

```
docker build -t docker-ubuntu-supervisor .
docker run -p 8080:8080 -p 22:22 --name docker-supervisor-container docker-ubuntu-supervisor
```

Now you can access the sample web server by typing the container's IP Address
in a browser.

To find out the container's IP Address you can type:

```
docker inspect --format "{{ .NetworkSettings.IPAddress }}" docker-supervisor-container
```
