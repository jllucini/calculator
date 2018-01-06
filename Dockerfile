FROM frolvlad/alpine-oraclejdk8:slim

COPY build/libs/Calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","calculator-0.0.1-SNAPSHOT.jar "]
