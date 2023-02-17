FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl

COPY ./conf/default /etc/nginx/sites-enabled/default

RUN openssl req -newkey rsa:4096 -days 42 -nodes -x509 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=cfontain.42.fr/UID=cfontain" \
	-out /etc/ssl/nginx.crt \
	-keyout /etc/ssl//nginx.key

RUN chmod 777 /var/www/html
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]

EXPOSE 443

