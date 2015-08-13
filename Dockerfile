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

# Install grow pip dependencies.
RUN pip install --upgrade pip
RUN pip install --upgrade six

# TODO: remove this when upgrading to 0.0.53.
RUN pip install -U git+http://github.com/bufordtaylor/python-texttable

# Fix some warnings with python2.7 SSL support.
# https://urllib3.readthedocs.org/en/latest/security.html#pyopenssl
RUN pip install pyopenssl ndg-httpsclient pyasn1

# Install Grow.
RUN pip install grow==0.0.52

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Confirm that grow and preprocessors run correctly.
RUN grow --help
RUN bower -v
RUN gulp -v
