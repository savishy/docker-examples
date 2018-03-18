# Step 1. Create the directory structure


## 1a. `Gemfile`

We will use Serverspec for this, which is a Ruby gem. We create a `Gemfile` in the directory as per instructions in [serverspec.org](http://serverspec.org/#installation).

## 1b. Stub files 

* We then create a `spec` directory which will eventually contain the specification for our Dockerfile.
* We also create a Dockerfile, which for now, is empty.

## 1c. `bundle install`, `bundle exec rspec`

* Now we `bundle install` to get the dependencies specified in our `Gemfile`.
* This maps the dependencies 

![docker-tdd-1](https://user-images.githubusercontent.com/13379978/36942734-177e1dda-1fa0-11e8-8f63-0f3b4e614284.gif)


## On to Step 2!

Proceed to the [step-2](../step-2) directory where we will write some failing tests.