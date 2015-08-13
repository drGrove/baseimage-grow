# baseimage-grow

**[in development, not ready for use]**

A minimal Docker image with Grow installed. Also includes Node, Bower, and Gulp for preprocessing.

## Usage

This image provides a convenient way to run isolated, one-off grow commands with all the correct
dependencies and preprocessors present. For example:

```bash
docker run --rm=true --workdir=/tmp -i grow/baseimage-grow \
  bash -c "git clone https://github.com/grow/growsdk.org.git && grow build growsdk.org/"
```

## Custom image

You can also use this image as the base for your new Docker image with different dependencies:

```
FROM grow/baseimage-grow:latest
```

It is recommended that you use a image tag like `:0.0.52` instead of the `:latest`.
