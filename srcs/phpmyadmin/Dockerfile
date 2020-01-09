FROM debian:buster
MAINTAINER Charles Chudant (cchudant@student.42.fr)

RUN apt-get update && \
	apt-get install -y wget nginx

RUN apt-get install -y php php-fpm php-mysqli php-pear php-mbstring \
	php-gettext php-common php-phpseclib php-mysql

RUN cd /tmp && \
	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
	tar -xvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
	rm phpMyAdmin*.tar.gz && \
	mv phpMyAdmin* /usr/share/phpmyadmin && \
	mkdir /etc/phpmyadmin

RUN ln -s /usr/share/phpmyadmin /var/www/html

COPY phpmyadmin-config.php /usr/share/phpmyadmin/config.inc.php

CMD service php7.3-fpm start && /usr/sbin/nginx -g 'daemon off;'

EXPOSE 80
