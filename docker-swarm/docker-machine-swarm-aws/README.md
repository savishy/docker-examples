This simple script provisions a Docker Swarm on AWS using Docker Machine.

## Prerequisites

You need to have an Amazon EC2 account.
Store your EC2 credentials (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`)
in the environment. You can also refer to the
[Docker guide](https://docs.docker.com/machine/drivers/aws/) for details.

Additionally, the common options `COMMON_OPTS` will need to be modified
according to details of your AWS.

## How to run

To execute, you can run `./run.sh`.

