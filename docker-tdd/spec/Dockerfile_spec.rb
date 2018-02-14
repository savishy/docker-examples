# Stub spec

require "serverspec"
require "docker"
describe "Dockerfile" do
    before(:all) do
      @image = Docker::Image.build_from_dir('.')
      @image.tag(repo: 'savishy/tomcat-petclinic', tag: 'latest')
  
      set :os, family: :alpine
      set :backend, :docker
      set :docker_image, @image.id
    end
    
    it "should have the maintainer label" do
      expect(@image.json["Config"]["Labels"].has_key?("maintainer"))
    end
end