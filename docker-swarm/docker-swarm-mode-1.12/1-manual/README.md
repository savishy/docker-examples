This simple shell script demonstrates a *manual* way to provision a Docker Swarm (1.12+).

## Prerequisites

* *Docker 1.12+ is needed to make this example work*, as this example uses the [Docker Swarm Mode feature.](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/)

* This is a `.sh` script, which means on Windows, you can only execute this within the *Docker Quickstart Terminal.*

## How to run

### Creating a swarm in Virtualbox

Execute `./run.sh` without any arguments. By default the Swarm is created using the `virtualbox` driver.

### Creating a swarm in AWS

Execute `./run.sh` with argument **`amazonec2`**. This creates the swarm in Amazon EC2.

```
./run.sh amazonec2
```
