## Introduction

*Note: this is a work in progress.*

This simple example demonstrates integration of Docker Machine with Vagrant.

To oversimplify things, Docker Machines are glorified Virtual Machines running
[`boot2docker`](https://github.com/boot2docker/boot2docker) (which is a
minimal Linux) and with Docker installed.

This can easily be achieved using Vagrant as well.

**Why would I want to do this?**

Good question.

1. If you are already using Vagrant, for e.g. and need a way to avoid typing
   `docker-machine` commands.
1. If you already have an Ansible playbook (or Chef or Puppet) for which the
   prerequisite is a set of Docker hosts.
1. If you just want to have fun.

## How to use

### Prerequisites

1. Vagrant
1. Linux recommended (not tested on Windows)
1. Docker Machine

### Steps

Run `./run.sh`.

This will

1. Use Vagrant's `virtualbox` provider to commission an Ubuntu VM.
1. Use Vagrant's Docker provisioner which installs Docker.
1. Run `docker-machine` with the `generic` driver. This adds the above-created
   machine to Docker Machine's inventory.

## Notes

### Alternatives to `lattice/ubuntu-trusty-64`

1. I am using `lattice/ubuntu-trusty-64` as the base image, which is large
   (~500MB).
1. An alternative is to use the
   [`boot2docker` vagrant box](https://github.com/mitchellh/boot2docker-vagrant-box/releases)
   released by `mitchellh`. *I haven't tried this out.*

### Finding the VM's IP address

As documented here:
http://stackoverflow.com/questions/14870900/how-to-find-vagrant-ip
This is a non-trivial task.


* To fetch the vagrant VM's address I tried using the
  [`vagrant-address`](https://github.com/mkuzmin/vagrant-address)
  plugin. Install it as `vagrant plugin install vagrant-address`.
* This plugin has
  [a known issue](https://github.com/mkuzmin/vagrant-address/issues/5) where
  it fails to fetch IP address. The workaround is listed in that issue.

My next approach was to simply query the VM for its IP address and parse the output.

### Removing the need for `run.sh`

One could possibly use the
[`vagrant triggers`](https://github.com/emyl/vagrant-triggers) plugin to avoid
controlling everything from an external script. This is for future implementation.

## References

1. https://www.vagrantup.com/docs/provisioning/docker.html
1. https://docs.docker.com/machine/drivers/generic/
1. http://blog.scottlowe.org/2015/08/04/using-vagrant-docker-machine-together/
