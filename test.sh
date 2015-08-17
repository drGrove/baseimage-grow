#!/bin/bash

set -e

docker run --rm=true --workdir=/tmp -i grow/baseimage \
  bash -c "git clone https://github.com/grow/growsdk.org.git && grow build growsdk.org/"
