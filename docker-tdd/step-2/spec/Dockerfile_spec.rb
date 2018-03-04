# A Stub spec for our Dockerfile.

require "serverspec"
require "docker"

# We describe the behavior of our Dockerfile.
describe "Dockerfile" do
    
    # The "Before" block executes actions before executing spec.
    # Within this block we build our Docker image using the Docker API for Ruby.
    # We create an @image object that can be used in our validation steps.

    before(:all) do
        @image = Docker::Image.build_from_dir('.')
        @image.tag(repo: 'savishy/tomcat-petclinic-tdd', tag: 'latest')
    
        set :os, family: :alpine
        set :backend, :docker
        set :docker_image, @image.id
    end

    # We have created stub tests based on our specs.
    # For now we are marking these tests pending.

    it "should have the maintainer label" do
        pending("not yet implemented")
        raise "todo"
    end
  
    it "should be based on tomcat" do
        pending("not yet implemented")
        raise "todo"
    end
  
    it "should have /app directory" do
        pending("not yet implemented")
        raise "todo"
    end
  
    it "should have petclinic.jar in /app directory" do
        pending("not yet implemented")
        raise "todo"
    end
  
end