#!/bin/bash

set -e

# Also needs to be updated in Dockerfile when changed.
GROW_VERSION=0.0.52

sudo docker build -t grow/baseimage:$GROW_VERSION -t grow/baseimage:latest .