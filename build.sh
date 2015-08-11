#!/bin/bash

set -e

# Also needs to be updated in Dockerfile when changed.
GROW_VERSION=0.0.53

docker build -t baseimage-grow:$GROW_VERSION -t baseimage-grow:latest .