

## Troubleshooting and Notes

1. Since I had a t2.micro instance with 30 GB of space, this ran out of space very soon when pulling `windowsservercore`-based images. I upgraded it to 60 GB of space and the images.

2. Getting error `the parameter is incorrect` when pulling the `windowsservercore` image (and possibly images based on it).

## References

1. [Document on getting started](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-server)

2. [Interesting script](https://github.com/StefanScherer/docker-windows-box/blob/master/windows10/scripts/install-docker.ps1)
