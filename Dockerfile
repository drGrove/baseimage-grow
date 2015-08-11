# Based on the Phusion baseimage (https://github.com/phusion/baseimage-docker).
# Check for new versions: https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
FROM phusion/baseimage:0.9.17
MAINTAINER Grow SDK Authors <hello@grow.io>

# Update system.
RUN apt-get update
RUN apt-get upgrade -y

# Install Grow dependencies.
RUN apt-get install -y --no-install-recommends python python-pip python-crypto
RUN apt-get install -y --no-install-recommends git curl

# Set environment variables.
ENV TERM=xterm

# Install Grow.
RUN \
  GROW_VERSION=0.0.53 \
  GROW_URL=https://raw.githubusercontent.com/grow/pygrow/${GROW_VERSION}/install.py \
  && scratch=$(mktemp -d -t tmp.${GROW_VERSION}.XXXXXXXXX) || exit \
  && script_file=$scratch/install_growsdk.py \
  && curl -fsSL $GROW_URL > $script_file || exit \
  && chmod 775 $script_file \
  && python $script_file --force

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Default command to run when this container is run (use baseimage-docker's init process).
# Do not change this or set CMD in inherited images. See: http://phusion.github.io/baseimage-docker/
CMD ["/sbin/my_init"]
