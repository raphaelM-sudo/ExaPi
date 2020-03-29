FROM ubuntu:18.04

RUN apt-get update -qq \
  && apt-get install -yq \
  bash \
  coreutils \
  findutils \
  curl \
  binfmt-support \
  cron \
  wget \
  libasound2 \
  && apt-get clean

ARG PI_VERSION

WORKDIR /tmp

COPY ./build.sh /tmp/

RUN chmod +x build.sh && \
  ./build.sh $PI_VERSION

ENTRYPOINT ["/usr/bin/exagear"]
