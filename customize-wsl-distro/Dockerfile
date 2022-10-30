FROM ubuntu:20.04
RUN apt-get -q update \
    && apt-get install -y -qq vim wget zip unzip git curl
# Install Sdkman & Gradle 7 & Java 17 & Maven
RUN curl -s "https://get.sdkman.io" | bash \
    && bash -c "source $HOME/.sdkman/bin/sdkman-init.sh \
    && sdk install gradle 7.5 \
    && sdk install java 17.0.0-ms \
    && sdk install maven 3.8.6"