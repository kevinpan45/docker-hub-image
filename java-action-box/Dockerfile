FROM ubuntu:20.04

USER root

COPY sources.list /etc/apt/sources.list

ARG GRADLE_VERSION=7.4.2
ARG MAVEN_VERSION=3.8.6
ARG JDK_VERSION=17.0.5-ms

ENV PATH=/root/.sdkman/candidates/java/current/bin:$PATH
ENV PATH=/root/.sdkman/candidates/scala/current/bin:$PATH
ENV PATH=/root/.sdkman/candidates/sbt/current/bin:$PATH

# Install packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y -qq install mysql-client-core-8.0 wget net-tools zip unzip git vim iftop iotop curl redis-tools
# Install SDKMAN
RUN curl -s "https://get.sdkman.io" | bash 

# Installing Java and Maven, removing some unnecessary SDKMAN files 
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && \
    yes | sdk install java ${JDK_VERSION} && \
    yes | sdk install maven ${MAVEN_VERSION} && \
    yes | sdk install gradle ${GRADLE_VERSION} && \
    rm -rf $HOME/.sdkman/archives/* && \
    rm -rf $HOME/.sdkman/tmp/*"
# Install Docker 
RUN curl -fsSL https://get.docker.com | bash -s docker

# Install Node.js 19x
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && \
    apt-get install -y nodejs

# Install OpenAPI Generator
RUN npm install @openapitools/openapi-generator-cli -g && \
    openapi-generator-cli version-manager set 6.2.0