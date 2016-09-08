FROM jenkins:2.7.1

# Jenkins Port
# TODO jenkins security needs to be set with HTTPS, using JENKINS_OPTS
ENV JENKINS_OPTS --httpPort=8081

# choose jenkins home
ENV JENKINS_HOME /var/lib/jenkins

USER root
RUN mkdir -p $JENKINS_HOME $JENKINS_HOME/ref $JENKINS_HOME/jobs

# fix for StreamCorruptedException when running Jenkins CLI
# https://issues.jenkins-ci.org/browse/JENKINS-35197
ENV JAVA_OPTS "-Djava.awt.headless=true -Dhudson.diyChunking=false"
ADD plugins.txt /usr/share/jenkins/ref/plugins.txt

COPY org.jenkinsci.plugins.dockerbuildstep.DockerBuilder.xml /var/jenkins_home/
RUN echo 2.7.1 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
USER root
WORKDIR /usr/share/jenkins/ref/plugins
RUN wget http://updates.jenkins-ci.org/download/plugins/script-security/1.13/script-security.hpi
RUN wget http://updates.jenkins-ci.org/download/plugins/junit/1.2/junit.hpi
RUN wget http://updates.jenkins-ci.org/download/plugins/matrix-project/1.6/matrix-project.hpi
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

