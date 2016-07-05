
## References 

* http://bundler.io/v1.3/rationale.html
* https://hub.docker.com/_/ruby/
* https://github.com/ksoichiro/dockerfiles/blob/master/android/Dockerfile
* http://askubuntu.com/questions/578172/cannot-install-ia32-libs-on-ubuntu-14-04-64bit

## What this Image Contains
* Ruby 2.1
* Calabash
* Android SDK `https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz`

## Create Gemfile and Gemfile.lock ###

*Note: obsolete since I moved away from using the Ruby image.*



*Note: this is only as a reference. You don't need to run this since the Gemfile and Gemfile.lock are already created and committed into the repo.*

Since I am using the base Ruby Docker image at https://hub.docker.com/_/ruby/,
I followed the instructions there. 

* Create a file named `Gemfile`.
* Put the `calabash-android` dependency in there. 

To create the `Gemfile.lock`, the Ruby docker link recommends to run the
following from the working directory:

* Execute `docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:2.1
  bundle install`

This generates the `Gemfile.lock`
