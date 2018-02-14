# Stub spec

require "serverspec"
require "docker"
describe "Dockerfile" do
    before(:all) do
      @image = Docker::Image.build_from_dir('.')
      @image.tag(repo: 'savishy/tomcat-petclinic-tdd', tag: 'latest')
  
      set :os, family: :alpine
      set :backend, :docker
      set :docker_image, @image.id
    end
    
    it "should have the maintainer label" do
      expect(@image.json["Config"]["Labels"].has_key?("author"))
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