# Step 1. Create the directory structure


## 1a. `Gemfile`

1. We will use Serverspec for this, which is a Ruby gem. 
1. We create a `Gemfile` in the directory as per instructions in [serverspec.org](http://serverspec.org/#installation).

Take a look at the [`Gemfile`](Gemfile).

## 1b. Stub files 

Take a look at the stub files we created:

1. A `spec` directory which will eventually contain the specification for our Dockerfile.
1. A single spec, [`Dockerfile_spec.rb`](spec/Dockerfile_spec.rb) which for now just has two `require` statements.
1. A [`Dockerfile`](Dockerfile), which again, is empty.

## 1c. `bundle install`, `bundle exec rspec`

* Now we `bundle install` to get the dependencies specified in our `Gemfile`.
* To execute the specs, we would do `bundle exec rspec`.  
* Since there are no specs, you won't see much useful output though.

![docker-tdd-1](https://user-images.githubusercontent.com/13379978/36942734-177e1dda-1fa0-11e8-8f63-0f3b4e614284.gif)


## On to Step 2!

Proceed to the [step-2](../step-2) directory where we will write some failing tests.