#!/bin/bash

set -e

# Also needs to be updated in Dockerfile when changed.
GROW_VERSION=0.0.52

docker build -t grow/baseimage-grow:$GROW_VERSION -t grow/baseimage-grow:latest .