FROM debian:stable-slim
LABEL maintainer=frankhjung
RUN export TERM=xterm \
 && apt-get --assume-yes --list-cleanup update \
 && apt-get --yes install docbook docbook-utils openjade
WORKDIR /opt/workspace
CMD /usr/bin/jw --version
