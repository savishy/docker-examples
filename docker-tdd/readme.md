## TDD and Docker with Serverspec

TDD is a software-development concept. Here we are demonstrating how *some aspects* of TDD can be adapted for use in Dockerfile development. 

* This example demonstrates using some aspects of Test-Driven Development to develop an example Dockerfile.
* Each subdirectory here will give you a step-by-step understanding of *how our Dockerized application evolves*.

## How To Use

### Prerequisites

1. A Linux system with the ability to run Ruby, Gems and Bundler is required.
1. A basic knowledge of Ruby, Rubygems, Gemfiles and Bundler is advised.
1. Understanding of the Docker API for Ruby is advised.

### Step 1. Create the stubs.

First we create the stub files and folders necessary.

See [step-1](step-1/) directory for details.

### Step 2. Write the specs.

* Next, we flesh out the specs (or "behavior" if you will) of our Docker image.
* At this stage, we do not have any content in our `Dockerfile` as yet. 
* We _do_, however, have a set of specs for the `Dockerfile` that when executed, fail. 
* See [step-2](step-2/) directory for detail.

### Step 3. Create the Dockerfile.

* Next we flesh out our Dockerfile so as to fulfil the specs.
* After incrementally filling out our `Dockerfile` we execute the spec each time.
* See [step-3](step-3/) directory.

## Walkthrough (How it was done)

1. First create the stub files `Gemfile`, `spec/Dockerfile_spec.rb`. ( ()[https://github.com/savishy/docker-examples/tree/0e0438452b11cff040b0099aec23f3d794a244d1/docker-tdd](0e043) ) 

1. Write a Failing Test.

1. Execute the test 

![image](https://user-images.githubusercontent.com/13379978/36203748-a0f17c10-11ae-11e8-886f-d0043750411f.png)


## References

1. [Serverspec](http://serverspec.org/)
1. [This great article](https://medium.com/@jesseadametz/test-driven-development-for-your-dockerfiles-350d4d415df7)
1. [This gist](https://gist.github.com/jadametz/f131def1253bbfe6f2d5ef975c20b768#file-docker-serverspec-tree)
1. [Rspec: creating pending examples](https://relishapp.com/rspec/rspec-core/v/2-4/docs/pending/pending-examples#pending-implementation)