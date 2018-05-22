FROM jenkinsci/blueocean

MAINTAINER Greg Milligan <xybersolve@gmail.com>

USER root

RUN apk update && \
    apk upgrade && \
    apk add --no-cache make

USER jenkins
