This is a demonstration on how to provision a Docker Swarm (1.12+) with Vagrant and Ansible in a hands-off fashion.

This example uses Docker Swarm Mode, a new feature in Docker 1.12+.

## Prerequisites

This uses the
[`ec2_group` module](http://docs.ansible.com/ansible/ec2_group_module.html).

* The module requires pip module `boto` as a prerequisite. Therefore, as a
  setup step, `boto` is installed on the **hosts** where this playbook
  runs. (You don't have to do anything).

Since we are interacting with AWS you need your `AWS_ACCESS_KEY` and
`AWS_SECRET_KEY` loaded into the environment.

  https://github.com/ansible/ansible/issues/5734

## References
1. https://docs.docker.com/engine/swarm/swarm-tutorial/
