# Step 2. Failing Tests

## 2a. Define the Spec

* Now we spec out our Docker container. 
* The spec files follow syntax defined by ServerSpec and RSpec. So keep the following docs handy 
* [The ServerSpec documentation](http://serverspec.org/resource_types.html) on resource-types
* [RSpec Documentation]

Broadly speaking we will write the following specifications for the application's containerized environment:

| Key | Value |
|-----|-------|
| Image OS | Alpine |
| Java Version | 8.x |
| Application Dir | `/app` |
| Maintainer Label | should have `Vish` |

( :exclamation: we can write more detailed specs, of course - for example based on how the running container would behave. )

## 2b. Execute the tests

Execute

```
bundle exec rspec
```

The failure will be similar to the GIF Below - it will likely complain about an empty `Dockerfile`.

![docker-tdd-2 2](https://user-images.githubusercontent.com/13379978/36944636-c7fed2f0-1fc6-11e8-97f7-9320d02cd1f0.gif)


In the next Step 3, we will flesh out our `Dockerfile`.

## References

1. [Guidelines for writing RSpec Tests](http://www.betterspecs.org/)
1. [The ServerSpec documentation](http://serverspec.org/resource_types.html)
1. [Docker API for Ruby](https://github.com/swipely/docker-api)
1. Existing articles on TDD and Docker: [1](https://www.unixdaemon.net/tools/testing-dockerfiles-with-serverspec/), [2](https://medium.com/@jesseadametz/test-driven-development-for-your-dockerfiles-350d4d415df7), [3](https://robots.thoughtbot.com/tdd-your-dockerfiles-with-rspec-and-serverspec)