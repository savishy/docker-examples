## README ##

References 

* http://bundler.io/v1.3/rationale.html

### Create Gemfile and Gemfile.lock ###

Since I am using the base Ruby Docker image at https://hub.docker.com/_/ruby/,
I followed the instructions there. 

* Create a file named `Gemfile`.
* Put the `calabash-android` dependency in there. 

To create the `Gemfile.lock`, the Ruby docker link recommends to run the
following from the working directory:

* Execute `docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1
  bundle install`
