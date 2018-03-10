# Step 4. Loop: Implement `Dockerfile`, Make Tests Pass, Refactor!

In [Step 3](../step-3/) we made one test pass, with one line in our Dockerfile.

## 4a. The Loop

Now its a matter of repeating the loop:

1. Implement a `pending` test;
1. Execute tests and it fails;
1. Write further instructions in your `Dockerfile`;
1. Execute tests and it passes;
1. Repeat

## 4b. Final Specs

Take a look at the file [`specs/Dockerfile_specs.rb`](specs/Dockerfile_specs.rb) for the full suite of implemented tests.

## 4c. Final `Dockerfile`

See [`Dockerfile`](Dockerfile).

## My TDD Journey

My journey to making tests pass looked something like this:

1 Passed, 1 Failed, 3 Pending

![image](https://user-images.githubusercontent.com/13379978/37238941-1067dda4-2457-11e8-96fc-1adda605efab.png)

2 Passed, 3 Pending

![image](https://user-images.githubusercontent.com/13379978/37238937-fc0e2bf6-2456-11e8-81be-7e7e635c601c.png)

2 Passed, 1 Failed, 2 Pending

![image](https://user-images.githubusercontent.com/13379978/37238933-ebe0f268-2456-11e8-8128-9d328b357289.png)

3 Passed, 2 Pending

![image](https://user-images.githubusercontent.com/13379978/37238930-e029f5be-2456-11e8-8c55-f7c40729ab11.png)

Nearly There! 4 Passed, 1 Pending!

![image](https://user-images.githubusercontent.com/13379978/37238928-cf23d6b8-2456-11e8-8f48-ac6815bf8b04.png)

All Passed! :heavy_check_mark: :heavy_check_mark: :heavy_check_mark: :heavy_check_mark: :heavy_check_mark: 

![image](https://user-images.githubusercontent.com/13379978/37238926-c0380f98-2456-11e8-8e6b-d4db9b6f2f7a.png)




## Known Issue - `java -version` output goes to `stderr` instead of `stdout`

* Open the [`Dockerfile_spec.rb`](spec/Dockerfile_spec.rb) in this directory.
* Look at the helper method `java_version`. It returns the `stderr` of the command `java -version`, _not the `stdout`_. Why is this?
* The answer is in this [Github issue discussion](https://github.com/test-kitchen/test-kitchen/issues/773).
* Long story short: `java -version` output is sent to `stderr`. This has been [known since the year 2000](https://bugs.java.com/bugdatabase/view_bug.do?bug_id=4380614) and likely will never change.


## References

1. [Guidelines for writing RSpec Tests](http://www.betterspecs.org/)
1. [The ServerSpec documentation](http://serverspec.org/resource_types.html)
1. [Docker API for Ruby](https://github.com/swipely/docker-api)
1. Existing articles on TDD and Docker: [1](https://www.unixdaemon.net/tools/testing-dockerfiles-with-serverspec/), [2](https://medium.com/@jesseadametz/test-driven-development-for-your-dockerfiles-350d4d415df7), [3](https://robots.thoughtbot.com/tdd-your-dockerfiles-with-rspec-and-serverspec)