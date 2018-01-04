FROM frolvlad/alpine-oraclejdk8:slim
RUN useradd -ms /bin/bash jenkins
USER jenkins
RUN  cd ~/agent/workspace/Calculator
COPY ./build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java",".jar","app.jar"]
