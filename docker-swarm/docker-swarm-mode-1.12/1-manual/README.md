This simple shell script demonstrates a *manual* way to provision a Docker Swarm (1.12+).

## Prerequisites

* *Docker 1.12+ is needed to make this example work*, as this example uses the [Docker Swarm Mode feature.](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/)

* This is a `.sh` script, which means on Windows, you can only execute this within the *Docker Quickstart Terminal.*

## Step 1. Create a Swarm

### In Virtualbox

Execute `./createSwarm.sh` without any arguments. By default the Swarm is created using the `virtualbox` driver.

### In AWS

Execute `./run.sh` with argument **`amazonec2`**. This creates the swarm in Amazon EC2.

```
./run.sh amazonec2
```
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
