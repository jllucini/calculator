FROM frolvlad/alpine-oraclejdk8:slim

WORKDIR build/libs/
ENTRYPOINT ["java","-jar","calculator-0.0.1-SNAPSHOT.jar "]
