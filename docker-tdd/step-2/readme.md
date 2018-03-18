# Step 2. Create Failing Tests

In [Step-1](../step-1), we created the directory structure. Now let's create some sample tests that fail.

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

## On to Step 3!

Proceed to the [step-3](../step-3) directory where we will flesh out our `Dockerfile` with functionality.
