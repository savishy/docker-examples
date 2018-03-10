# Step 3. Create the Dockerfile and Make Tests Pass


## 3a. Write a line in your `Dockerfile`

* As defined in our tests, we need an Alpine-based image containing OpenJDK, i.e [`openjdk:8-alpine`](https://hub.docker.com/_/openjdk/).

![docker-tdd-from-openjdk](https://user-images.githubusercontent.com/13379978/36944982-8d7a131e-1fcc-11e8-8d0e-efadf2131a23.gif)


## 3b. Execute the Tests - all tests are now `pending`

Execute

```
bundle exec rspec
```

The output will indicate that the tests are now `pending` (yellow color). This is because none of our test logic is implemented yet.

![image](https://user-images.githubusercontent.com/13379978/36944189-15dbea80-1fbd-11e8-9420-d506dbdfbb81.png)


## 3c. Flesh Out a Test Spec

So far our tests were simply **Stubs** marked as pending. Now we flesh the code to test for Alpine OS. i.e. this spec:

`it "should have alpine OS" do`

> How do we validate that the OS inside the Docker container is _indeed_ Alpine? We can parse the output of `/etc/os-release` for one solution.

* First we write a little helper method, `os_release`, within [`Dockerfile_spec.rb`](Dockerfile_spec.rb)
* The helper returns the output of `/etc/os-release`.
* On an Alpine OS the output is

```
/ # cat /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.7.0
PRETTY_NAME="Alpine Linux v3.7"
HOME_URL="http://alpinelinux.org"
BUG_REPORT_URL="http://bugs.alpinelinux.org"
```

![docker-tdd-developing-specs](https://user-images.githubusercontent.com/13379978/36944974-82ca7f58-1fcc-11e8-9f6c-1f87f90ed4c1.gif)


* Next, let's write the test that uses the helper.
* The test will run the helper method `os_release` and verify it contains the word "alpine" as well as "3.7.0".

![docker-tdd-developing-specs-2](https://user-images.githubusercontent.com/13379978/36944975-8309cdc0-1fcc-11e8-9d64-859ffbcc954c.gif)

## 3d. Run the Tests

Now we rerun the tests. Again, using 

```
bundle exec rspec
```

Et Voila, we now have _one passing test_ :heavy_check_mark: ! You should see the following output:

![image](https://user-images.githubusercontent.com/13379978/37237963-fe048c1c-2441-11e8-8171-9914e2ba9534.png)

And totally, 5 specs ran, of which 1 passed and 4 are pending:

![image](https://user-images.githubusercontent.com/13379978/36944996-da30f3bc-1fcc-11e8-9625-382c169b35a8.png)


## References

1. [Guidelines for writing RSpec Tests](http://www.betterspecs.org/)
1. [The ServerSpec documentation](http://serverspec.org/resource_types.html)
1. [Docker API for Ruby](https://github.com/swipely/docker-api)
1. Existing articles on TDD and Docker: [1](https://www.unixdaemon.net/tools/testing-dockerfiles-with-serverspec/), [2](https://medium.com/@jesseadametz/test-driven-development-for-your-dockerfiles-350d4d415df7), [3](https://robots.thoughtbot.com/tdd-your-dockerfiles-with-rspec-and-serverspec)