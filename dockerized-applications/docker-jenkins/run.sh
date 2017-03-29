docker stop jenkins-container && docker rm jenkins-container
docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`/jenkins-home:/var/lib/jenkins -p 8081:8081 --name jenkins-container docker-jenkins
