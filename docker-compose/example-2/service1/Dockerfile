# Using tomcat7 JRE8
FROM tomcat:7-jre8
# Copy JAR to webapps to create self-contained Docker Image.
COPY target/service1.war /usr/local/tomcat/webapps/service1.war
# Expose application Port.
EXPOSE 8080
