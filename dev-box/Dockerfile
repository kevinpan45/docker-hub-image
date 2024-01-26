FROM ubuntu:22.04

USER root

ARG GRADLE_VERSION=8.5
ARG MAVEN_VERSION=3.9.6
ARG JDK_VERSION=21.0.2-ms

ENV PATH=/root/.sdkman/candidates/java/current/bin:$PATH
ENV PATH=/root/.sdkman/candidates/maven/current/bin:$PATH
ENV PATH=/root/.sdkman/candidates/gradle/current/bin:$PATH

# Install packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y -qq install mysql-client-core-8.0 wget net-tools zip unzip git vim iftop iotop curl redis-tools lsb-core
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

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash - && \
    apt-get install -y nodejs

# Install Yarn
RUN npm install -g yarn

# Install OpenAPI Generator
RUN npm install @openapitools/openapi-generator-cli -g && \
    openapi-generator-cli version-manager set 7.2.0

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Install Helm
RUN curl https://baltocdn.com/helm/signing.asc | apt-key add - && \
    apt-get install apt-transport-https --yes && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && \
    apt-get install helm

# Install Kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.22.4/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# Install Vault
RUN apt-get install gpg coreutils && \
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt update && \
    apt-get install vault