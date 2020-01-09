FROM debian:buster
MAINTAINER Charles Chudant (cchudant@student.42.fr)

RUN apt-get update && \
    apt-get install -y wordpress nginx

RUN apt-get install -y php php-fpm php-mysqli php-pear php-mbstring \
	php-gettext php-common php-phpseclib php-mysql

COPY wordpress-config.php /etc/wordpress/config-default.php

RUN ln -s /usr/share/wordpress /var/www/html

CMD service php7.3-fpm start && /usr/sbin/nginx -g 'daemon off;'

EXPOSE 80
