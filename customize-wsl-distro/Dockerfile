FROM ghcr.io/kevinpan45/dev-box:latest

# Install packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y -qq install cockpit

# Set taobao registry
RUN npm config set registry https://registry.npm.taobao.org

# Install Nomad
RUN apt-get install nomad