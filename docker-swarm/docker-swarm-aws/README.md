### AWS + Vagrant + Docker Swarm example ###

This is an example of using Docker to provision a swarm in AWS.

1. Vagrant is used to provision each node in the swarm.
   The node info is read from a JSON `aws.json`.
1. Vagrant runs an ansible playbook to setup Docker Swarm


## How to use

### Prerequisites ###

As you see in the `Vagrantfile`, the following environment variables are used
during configuration.

So make sure to set these environment variables beforehand.

```
keypair_name = ENV['AWS_KEYPAIR_NAME'] # keypair name to access AWS
access_key_id = ENV['AWS_ACCESS_KEY'] # AWS access key
secret_access_key = ENV['AWS_SECRET_KEY'] # AWS Secret Access Key
security_groups = ENV['AWS_SECURITYGROUP'] # Security group that you want your
# instances to belong to 
private_key_path = ENV['AWS_KEYPATH'] # path to a keypair PEM file.
```

### Run

Run `./vagrantup.sh`.
