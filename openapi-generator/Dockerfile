FROM python:3.13.2

ARG GRADLE_VERSION=8.5
ARG MAVEN_VERSION=3.9.6
ARG JDK_VERSION=21.0.2-ms

ENV PATH=/root/.sdkman/candidates/java/current/bin:$PATH
ENV PATH=/root/.sdkman/candidates/maven/current/bin:$PATH
ENV PATH=/root/.sdkman/candidates/gradle/current/bin:$PATH

# Install packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y -qq install wget net-tools zip unzip vim curl

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py

# Install SDKMAN
RUN curl -s "https://get.sdkman.io" | bash 

# Installing Java and Maven, removing some unnecessary SDKMAN files 
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && \
    yes | sdk install java ${JDK_VERSION} && \
    yes | sdk install maven ${MAVEN_VERSION} && \
    yes | sdk install gradle ${GRADLE_VERSION} && \
    rm -rf $HOME/.sdkman/archives/* && \
    rm -rf $HOME/.sdkman/tmp/*"

# Install Node.js 19x
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash - && \
    apt-get install -y nodejs

# Install OpenAPI Generator
RUN npm install @openapitools/openapi-generator-cli -g && \
    openapi-generator-cli version-manager set 7.4.0