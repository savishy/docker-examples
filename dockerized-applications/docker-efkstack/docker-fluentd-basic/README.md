# `docker` and `fluentd` example #

This example ties together a dockerized web-app and a `fluentd` logging
daemon.

* In true Docker style, the `fluentd` logging daemon is also a Docker
  container.
* Creating and starting the various containers is done using a
  `docker-compose.yml`.



## To run this example ##

Type `docker-compose up`. You need to have Docker Compose, obviously.

## Tips/Troubleshooting ##

### How do I access the running web-server? ###

The container's IP Address suffices for a hostname, and you would type that in
a browser.

But *how do you get the IP address*?

First locate the web-app container's name, e.g. `dockerfluentd_web-app_1` then type:
```
docker inspect dockerfluentd_web-app_1
```

This will output a JSON. Look at the following path:

```
       "NetworkSettings": {
...
            "Networks": {
                "dockerfluentd_default": {
                           "Gateway": "172.19.0.1",
                           "IPAddress": "172.19.0.3",

```

This means that for creating the `fluentd`-webapp tie-up, Docker has created a
network called `dockerfluentd_default` and assigned the web-app container an
IP of 172.19.0.3.

Note: the shorthand for accessing this value directly is

```
docker inspect --format "{{ .NetworkSettings.Networks.dockerfluentd_default.IPAddress }}" <container-name>
```


### If you get `getsockopt: connection refused` errors ###

If starting the application with `docker-compose up` gives you errors such as:

```
ERROR: for web-app  Failed to initialize logging driver: dial tcp
192.168.0.1:24224: getsockopt: connection refused
ERROR: Encountered errors while bringing up the project.
```

Do the following checks:

1. In your `docker-compose.yml` check whether the IP address specified under
    the `logging:fluentd-address` section is valid, e.g

    ```
    logging:
      driver: fluentd
      options:
        fluentd-address: "192.168.0.1:24224"
      ```
  ([reference](https://github.com/docker/docker/issues/22464#issuecomment-216546128))

2. Make sure the `/data/` folder is writable by the trusted user running
   Docker. The `fluentd` container mounts this folder for storing logs.


## References ##

1. https://github.com/docker/docker/issues/22464
1. http://www.fluentd.org/guides/recipes/docker-logging
1. https://github.com/docker/compose/issues/2515
