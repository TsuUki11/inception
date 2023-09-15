FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN mkdir -p /var/www/html

RUN apt-get install php7.3-cli php7.3-fpm php-mysql php7.3-json php7.3-opcache php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl mariadb-client wget curl -y

COPY ./tools/script.sh script.sh

RUN mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

CMD ["bash", "script.sh"]