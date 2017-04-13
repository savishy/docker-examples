This simple shell script demonstrates a *manual* way to provision a Docker Swarm (1.12+).

## Prerequisites

* *Docker 1.12+ is needed*, as this example uses the [Docker Swarm Mode feature.](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/)

* This is a `.sh` script, which means on Windows, you can only execute this within the *Docker Quickstart Terminal.*

**If provisioning AWS Docker-Machines:**

You will need an AWS Account. 

Create a script `setenv.sh` *in the same directory as `createSwarm.sh`*. (This script is absent by default). 

The script needs to have the following content:

```bash
# aws access key and secret key
export AWS_ACCESS_KEY=
export AWS_SECRET_KEY=

# security group name to be used for this docker-swarm.
export AWS_SECURITYGROUP=
# VPC ID that your security group belongs to.
export AWS_VPC_ID=

# the AWS region you want to use.
export AWS_DEFAULT_REGION=ap-south-1
export AWS_DEFAULT_ZONE=a

# Specify the name of an existing AWS keypair.
# You will also need to have the public key for this keypair.
#https://github.com/docker/machine/issues/661

export AWS_KEYPAIR_NAME=vish_agility_aws_docker_swarm_keypair

# Specify the local path to the private key of above keypair.
export AWS_SSH_KEYPATH=

```


## Step 1. Create a Swarm

**Virtualbox**

Execute `./createSwarm.sh`.

**AWS**

Execute `./create.sh amazonec2`.

## Step 2. Deploy a Service to Swarm

### 2a. Petclinic
Execute the script

```
./deployService-petclinic.sh
```
This deploys the [savishy/tomcat-petclinic](https://hub.docker.com/r/savishy/tomcat-petclinic) image as a service to the swarm.

### 2b. node-webapp

*This is a good demo example of overlay networks and load-balancing.*

Alternatively you may run

```
./deployService-nodewebapp.sh
```

This does the following
1. Creates an Overlay network
1. Deploys a node webapp and a redis db service.

Afterward, hit one of the Swarm IP addresses repeatedly (e.g. `curl http://192.168.99.101`). You will see that the request goes in a round-robin fashion to each of the containers running the service.

## Troubleshooting

### AWS: What ports need to be opened in my security group? 

[reference.](https://docs.docker.com/engine/swarm/swarm-tutorial/#open-protocols-and-ports-between-the-hosts)

![image](https://cloud.githubusercontent.com/assets/13379978/24997496/7a404dea-2054-11e7-9510-abdff4ffeda9.png)

### Issue creating Docker Swarm (AWS) behind some corporate networks

Some corporate networks tend to block either AWS, or non-standard ports like 2376. In such cases, you might face an issue similar to:

![image](https://cloud.githubusercontent.com/assets/13379978/24996265/dc6d696c-204f-11e7-9f3b-0dc59f0bb32d.png)

**TODO**: Need to find a workaround for this. 
