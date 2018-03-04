# Step 2. Failing Tests

## 2a. Define the Spec

* Now we spec out our Docker container. 
* The spec files follow syntax defined by ServerSpec and RSpec. So keep the following docs handy 
* [The ServerSpec documentation](http://serverspec.org/resource_types.html) on resource-types
* [RSpec Documentation]


## 2b. Execute the tests

Execute

```
bundle exec rspec
```

The failure will be similar to the GIF Below - it will likely complain about an empty `Dockerfile`.

![docker-tdd-2](https://user-images.githubusercontent.com/13379978/36943176-2cb50524-1faa-11e8-9fbd-85e267db989d.gif)


In the next Step 3, we will flesh out our `Dockerfile`.

## References

1. [Guidelines for writing RSpec Tests](http://www.betterspecs.org/)
1. [The ServerSpec documentation](http://serverspec.org/resource_types.html)
1. [Docker API for Ruby](https://github.com/swipely/docker-api)
1. Existing articles on TDD and Docker: [1](https://www.unixdaemon.net/tools/testing-dockerfiles-with-serverspec/), [2](https://medium.com/@jesseadametz/test-driven-development-for-your-dockerfiles-350d4d415df7), [3](https://robots.thoughtbot.com/tdd-your-dockerfiles-with-rspec-and-serverspec)