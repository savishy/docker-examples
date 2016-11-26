# Docker UltraESB Application #

Example of Docker with UltraESB.

## How to run

`docker-compose up`

## About the UltraESB Docker Container

1. `ULTRA_HOME` environment is set inside the container, which points to the UltraESB home directory.
1. Two directories are mounted as volumes: the `/var/ultraesb/` directory for logs and `/opt/ultraesb-2.3.0-min/conf` for configuration.
