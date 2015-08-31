FROM ubuntu:trusty
MAINTAINER Grow SDK Authors <hello@grow.io>

# Update system.
RUN apt-get update
RUN apt-get upgrade -y

# Set environment variables.
ENV TERM=xterm

# Install preprocessor dependencies and tools.
RUN apt-get install -y --no-install-recommends nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g bower
RUN npm install -g gulp

# Install Grow dependencies.
RUN apt-get install -y --no-install-recommends \
  python python-pip build-essential python-all-dev zip \
  libc6 libyaml-dev libffi-dev libxml2-dev libxslt-dev libssl-dev
RUN apt-get install -y --no-install-recommends git curl ssh

ADD grow-install.sh /tmp/grow/
RUN bash /tmp/grow/grow-install.sh 0.0.54
RUN ln -s /root/bin/grow /usr/local/bin/grow

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Confirm that grow and preprocessors run correctly.
RUN grow --help
RUN bower -v
RUN gulp -v
