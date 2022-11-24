FROM ubuntu:20.04

USER root

# COPY sources.list /etc/apt/sources.list

# Install packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y -qq install mysql-client-core-8.0 wget net-tools zip unzip git vim iftop iotop curl
# Install SDKMAN
RUN curl -s "https://get.sdkman.io" | bash
RUN source "/root/.sdkman/bin/sdkman-init.sh"
# Install Maven
RUN sdk install java 17.0.5-ms
# Install Maven
RUN sdk install maven 3.8.6
# Install Gradle 
RUN sdk install gradle 7.5.1
# Install Docker 
RUN curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
