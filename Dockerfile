FROM openjdk:11
EXPOSE 8080
ADD target/room-services-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/room-services-0.0.1-SNAPSHOT.jar"]
