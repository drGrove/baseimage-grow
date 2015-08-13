#!/bin/bash

set -e

docker run --rm=true -i grow/baseimage-grow bash -c \
 "
 cd /tmp \
   && git clone https://github.com/grow/growsdk.org.git \
   && cd /tmp/growsdk.org \
   && grow build .
 "
