## Introduction

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

**What does this example do?**

Here we will
1. Use Vagrant's `virtualbox` provider to commission an Ubuntu VM.
1. Use Vagrant's Docker provisioner to convert this VM into a Docker Machine.


## How to use

### Prerequisites

1. Vagrant
1. Linux recommended (not tested on Windows)

### Steps

Run `vagrant up`.

## Notes

### Alternatives to `lattice/ubuntu-trusty-64`

1. I am using `lattice/ubuntu-trusty-64` as the base image, which is large
   (~500MB).
1. An alternative is to use the
   [`boot2docker` vagrant box](https://github.com/mitchellh/boot2docker-vagrant-box/releases)
   released by `mitchellh`. *I haven't tried this out.*
