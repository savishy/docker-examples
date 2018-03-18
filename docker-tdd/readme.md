## TDD and Docker with Serverspec

TDD is a software-development concept. Here we are demonstrating how *some aspects* of TDD can be adapted for use in Dockerfile development. 

* This example demonstrates using some aspects of Test-Driven Development to develop an example Dockerfile.
* Each subdirectory here will give you a step-by-step understanding of *how our Dockerized application evolves*.

## About our Application

* We are creating a Dockerized version of a Spring-Boot Java app - [petclinic](http://github.com/savishy/spring-petclinic).
* A binary JAR of this has already been compiled and uploaded here: [spring-petclinic-1.5.1.jar](https://github.com/savishy/spring-petclinic/releases/download/v1.5.1/spring-petclinic-1.5.1.jar)


## How To Use

### Prerequisites

1. A Linux system with the ability to run Ruby, Gems and Bundler is required.
1. Docker `17.05-ce` or greater should be installed.
1. A basic knowledge of Ruby, Rubygems, Gemfiles and Bundler is advised.
1. Understanding of the Docker API for Ruby is advised.

### Step 1. Create the directory structure.

* First we create the stub files and folders necessary.
* See [step-1](step-1/) directory for details.

### Step 2. Create Failing Tests.

* Next, we flesh out the specs (or "behavior" if you will) of our Docker image.
* See [step-2](step-2/) directory for detail.

### Step 3. Create the Dockerfile and Make Tests Pass.

* Next we flesh out our Dockerfile so as to fulfil the specs.
* After incrementally filling out our `Dockerfile` we execute the spec each time.
* See [step-3](step-3/) directory.

### Step 4. Loop: Implement `Dockerfile`, Make Tests Pass, Refactor!

* Continue implementing the rest of the tests. 
* Watch the tests fail, implement your `Dockerfile` and rerun the tests until they pass.
* Refactor as necessary.
* See [step-4](step-4/) directory.


## References

1. [Serverspec](http://serverspec.org/)
1. [This gist](https://gist.github.com/jadametz/f131def1253bbfe6f2d5ef975c20b768#file-docker-serverspec-tree)
1. [Rspec: creating pending examples](https://relishapp.com/rspec/rspec-core/v/2-4/docs/pending/pending-examples#pending-implementation)
1. [Guidelines for writing RSpec Tests](http://www.betterspecs.org/)
1. [The ServerSpec documentation](http://serverspec.org/resource_types.html)
1. [Docker API for Ruby](https://github.com/swipely/docker-api)
1. Existing articles on TDD and Docker: [1](https://www.unixdaemon.net/tools/testing-dockerfiles-with-serverspec/), [2](https://medium.com/@jesseadametz/test-driven-development-for-your-dockerfiles-350d4d415df7), [3](https://robots.thoughtbot.com/tdd-your-dockerfiles-with-rspec-and-serverspec)