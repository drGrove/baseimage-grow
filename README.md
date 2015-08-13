# baseimage-grow

**[in development, not ready for use]**

A minimal Docker image with Grow installed. Also includes Node, Bower, and Gulp for preprocessing.

## Usage

This image provides a convenient way to run isolated, one-off grow commands with all the correct
dependencies and preprocessors present. For example:

```bash
docker run --rm=true --workdir=/tmp -i grow/baseimage \
  bash -c "git clone https://github.com/grow/growsdk.org.git && grow build growsdk.org/"
```

### Custom image

You can also use this image as the base for your new Docker image with different dependencies:

```
FROM grow/baseimage:latest
```

It is recommended that you use a image tag like `:0.0.52` instead of the `:latest`.

## Development

Use the following convenience scripts:

```
./build.sh
./test.sh
./deploy.sh
```

Note: build.sh will always tag the local image with `:latest` and deploy.sh will deploy
the image to Docker Hub. Don't run the deploy script unless you are sure the `:latest` tag is ready
to be updated.

