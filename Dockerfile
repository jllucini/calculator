FROM frolvlad/alpine-oraclejdk8:slim

ENV JENKINS_HOME /var/jenkins_home

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000


# Jenkins is run with user `jenkins`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN addgroup -g ${gid} ${group} \
    && adduser -h "$JENKINS_HOME" -u ${uid} -g ${gid} -s /bin/bash ${user}
RUN  su - jenkins
RUN  cd /home/jenkins/agent/workspace/Calculator
COPY ./build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java",".jar","app.jar"]
