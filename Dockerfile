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

ARG PI_VERSION=4

WORKDIR /tmp

COPY ./build.sh /tmp/

RUN chmod +x build.sh && \
  echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p && \
  ./build.sh $PI_VERSION

COPY ./start.sh /

ENTRYPOINT ENTRYPOINT ["/start.sh"]
