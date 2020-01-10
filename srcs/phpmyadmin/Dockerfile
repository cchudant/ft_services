FROM phpmyadmin/phpmyadmin:fpm-alpine

RUN apk update && \
	apk add nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint /entrypoint

ENTRYPOINT sh /entrypoint
