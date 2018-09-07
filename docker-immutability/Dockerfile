# Dockerfile for Petclinic DEV
FROM java:8u111-jdk-alpine

# Labels allow for metadata and visibility
LABEL com.petclinic.maintainer="Vish"
LABEL com.petclinic.description="Petclinic Application JAR"


# Application and configuration
ADD petclinic.jar /app/petclinic.jar

# We will not add the application.properties file into the image
# as it is environment dependent.
# Adding env dependent files into an image breaks immutability.

# ADD application.properties /app/application.properties

ENV JAVA_OPTS=""

# add script to wait for connections.
# https://docs.docker.com/compose/startup-order/
ADD wait-for-it.sh /app/wait-for-it.sh


# Spring app needs to take local application.properties
ENV SPRING_OPTS="--spring.config.location=/app/application.properties"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app/petclinic.jar $SPRING_OPTS" ]
