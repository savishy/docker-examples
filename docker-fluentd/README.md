# `docker` and `fluentd` example #

This example ties together a dockerized web-app and a `fluentd` logging
daemon.

* In true Docker style, the `fluentd` logging daemon is also a Docker
  container.
* Creating and starting the various containers is done using a
  `docker-compose.yml`.

## Tips/Troubleshooting ##

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
