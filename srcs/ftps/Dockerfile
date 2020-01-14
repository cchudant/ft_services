FROM alpine

ENV PUREFTPD_VERSION=1.0.42-r0 \
    SYSLOG_STDOUT_VERSION=1.1.1

RUN printf '%s\n' \
      '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' \
      >> /etc/apk/repositories \
    && apk update \
    && apk add pure-ftpd@testing=1.0.49-r0

COPY entrypoint-target /entrypoint

ENTRYPOINT sh /entrypoint
