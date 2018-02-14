## How to run

### Prerequisites

* Ruby 
* Bundler

### Execute `bundle install`

Example output:

```
vish@freeman:docker-examples/docker-tdd$ bundle install

Fetching gem metadata from https://rubygems.org/............
Fetching version metadata from https://rubygems.org/..
Resolving dependencies...
Installing diff-lcs 1.3
Installing multi_json 1.13.1
Installing net-ssh 4.2.0
Using net-telnet 0.1.1
Installing rspec-support 3.7.1
Installing sfl 2.3
Using bundler 1.13.0
Installing net-scp 1.2.1
Installing rspec-core 3.7.1
Installing rspec-expectations 3.7.0
Installing rspec-mocks 3.7.0
Installing specinfra 2.73.2
Installing rspec-its 1.2.0
Installing rspec 3.7.0
Installing serverspec 2.41.3
Bundle complete! 1 Gemfile dependency, 15 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

## Walkthrough (How it was done)

1. First create the stub files `Gemfile`, `spec/Dockerfile_spec.rb`. ( ()[https://github.com/savishy/docker-examples/tree/0e0438452b11cff040b0099aec23f3d794a244d1/docker-tdd](e52dbb) ) 


## References

1. [Serverspec](http://serverspec.org/)
1. [This great article](https://medium.com/@jesseadametz/test-driven-development-for-your-dockerfiles-350d4d415df7)
1. [This gist](https://gist.github.com/jadametz/f131def1253bbfe6f2d5ef975c20b768#file-docker-serverspec-tree)