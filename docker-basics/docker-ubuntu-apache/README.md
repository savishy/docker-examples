# Docker + Ubuntu + Apache

## How to use

You will notice two Dockerfiles:
```
Dockerfile.good
Dockerfile.bad
```

* The `bad` Dockerfile contains the *incorrect way of starting Apache.*
* The `good` Dockerfile contains *one of the correct ways to start Apache.*

Build an image first. Run the following command after `cd`ing to the `docker-ubuntu-apache` directory:

```
docker build -t docker-ubuntu-apache -f Dockerfile.good
```

The `-f` argument tells Docker to look for a file named `Dockerfile.good`. Leaving this out will mean Docker looks for a file named `Dockerfile` (which doesn't exist) and fails.

Next, run a container from the image:

```
docker run docker-ubuntu-apache
```

Now load your container's IP address in a browser e.g. 172.17.0.2. If all goes well you should see the Apache page.

### Diving Deep

1. The `bad` Dockerfile tries to start an Apache service (`service apache2 start`) in a `RUN` command. There are lots of docs on why this will not work.
1. The `good` Dockerfile also has a line: `CMD /etc/init.d/apache2 start`. This ultimately is the same as `service apache2 start`

The objective is to start Apache in the foreground. Some googling leads us to multiple sources on how to accomplish this: [1](http://zroger.com/blog/apache-in-the-foreground/) and [2](http://stackoverflow.com/a/27769732/682912).
The commands listed in these are what I have used within the `CMD` tags.

## Notes

The Dockerfile is a good example to get started, but shouldn't be used in production as it has several glaring issues:
* No initialization of the MySQL root password
* Not disabling interactive mode.
* Starting with Ubuntu as a base image when we could easily use `httpd`.
