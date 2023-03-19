FROM debian:buster

RUN apt update && apt upgrade

RUN deluser www-data

RUN useradd -m -p "$WWW_DATA_USER_PASS" www-data

RUN mkdir -p /var/www/html

RUN apt install php7.3-cli php7.3-fpm php7.3-mysql php7.3-json php7.3-opcache php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl mariadb-client -y

#redis instalation

# RUN apt install redis-server php-redis -y

COPY ./tools/script.sh script.sh

RUN mkdir -p /run/php

RUN touch /run/php/php7.3-fpm.pid

RUN chown -R www-data: /run/php

RUN apt install curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN apt install less sendmail -y

CMD ["bash", "script.sh"]