# baseimage-grow

**[in development, not ready for use]**

A minimal Docker image with Grow installed.

## Usage

Just use this image as the base for your new Docker image:

```
FROM grow/baseimage-grow:0.0.53
...
```

It is recommended that versions are based on a specific tag, but you can also use `:latest`.
This image is based on [https://github.com/phusion/baseimage-docker](phusion/baseimage-docker),
so images that inherit from it should use baseimage's mechanisms for setting up daemons and scripts.
