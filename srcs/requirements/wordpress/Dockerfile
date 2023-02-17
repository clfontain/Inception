FROM debian:buster

EXPOSE 9000

RUN apt-get update -y

RUN apt-get upgrade -y


RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client curl

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz
RUN cd /var/www && tar -xvf latest.tar.gz

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
RUN chmod +x ./usr/bin/wp

RUN mkdir /run/php


COPY ./tools/script_wp.sh /var/www/wordpress/script_wp.sh
RUN chmod +x /var/www/wordpress/script_wp.sh
ENTRYPOINT ["bash", "/var/www/wordpress/script_wp.sh"]
