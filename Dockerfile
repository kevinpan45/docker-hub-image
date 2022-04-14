FROM ubuntu:20.04

USER root

ENV PATH=/usr/local/apache-maven-3.8.5/bin:$PATH

RUN apt-get update && apt-get install -y -qq wget vim zip unzip \
    && apt-get install -y -qq openjdk-17-jdk \
    && wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.zip && unzip apache-maven-3.8.5-bin.zip && mv apache-maven-3.8.5 /usr/local/

RUN java -version && mvn -version