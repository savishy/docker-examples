*This is a work in progress.*
This is a Centos 6 based Docker container that you can SSH into.

## About

This effort started because I needed a Docker container mimicking CentOS
systems, to develop Ansible playbooks on.

## How to run

Execute the `create.sh` script. This does the following
* create key pair `ansible_id_rsa` and `ansible_id_rsa.pub`.
* Paste a local copy (in current working dir) which will be used for Docker image creation.
* Paste a copy to `$HOME/.ssh/`.
* Create a Docker Image `docker-ssh` which contains centos 6 *plus all customizations required for SSH into a CentOS container*.
* Run a container off it, `docker-ssh-container`.

Now, to SSH to it, Execute

```
ssh -i ~/.ssh/ansible_id_rsa root@172.17.0.2 -p 22
```
