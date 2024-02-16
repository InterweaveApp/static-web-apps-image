FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y curl && mkdir -p /opt/buildscriptgen && mkdir -p /opt/oryx
COPY staticappsclient/buildscriptgen /opt/buildscriptgen/
COPY staticappsclient/staticsites /bin/staticsites
RUN ln -s /opt/buildscriptgen/GenerateBuildScript /opt/oryx/oryx
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - &&\
RUN apt-get install -y nodejs
ENV DEBIAN_FLAVOR=bullseye PATH="/opt/oryx:${PATH}"
