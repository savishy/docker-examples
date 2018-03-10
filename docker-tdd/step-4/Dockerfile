# A stub dockerfile for now.
FROM openjdk:8-alpine
MAINTAINER Vish
RUN mkdir /app
ADD https://github.com/savishy/spring-petclinic/releases/download/v1.5.1/spring-petclinic-1.5.1.jar /app/petclinic.jar
CMD ["java","-jar","/app/petclinic.jar"]