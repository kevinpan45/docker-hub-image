FROM ghcr.io/kevinpan45/dev-box:latest

# Install packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y -qq install cockpit

# Set taobao registry
RUN npm config set registry https://registry.npm.taobao.org

# Install Nomad
RUN apt-get install nomad

WORKDIR /root

# Install Starship
RUN curl -fsSL https://starship.rs/install.sh | sh -s -- -y \
    && echo 'eval "$(starship init bash)"' >> /root/.bashrc

# append cd ~ to bashrc
RUN echo "cd ~" >> /root/.bashrc

# Bash as entrypoint
ENTRYPOINT ["/bin/bash"]