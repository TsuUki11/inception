FROM debian:buster

RUN apt update && apt upgrade

RUN apt install wget -y

RUN deluser www-data

RUN useradd -m -p "$WWW_DATA_USER_PASS" www-data

RUN mkdir -p /var/www/html

RUN cd /var/www/html && wget https://wordpress.org/latest.tar.gz && tar xf latest.tar.gz && rm -rf latest.tar.gz && chown -R www-data: wordpress

RUN apt install php7.3 php7.3-cli php7.3-fpm php7.3-json php7.3-opcache php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl -y

COPY ./tools/script.sh script.sh

RUN bash script.sh

RUN mkdir -p /run/php

RUN touch /run/php/php7.3-fpm.pid

RUN chown -R www-data: /run/php

# CMD ["service", "php7.3-fpm", "start", "&&", "while", "1"]

CMD ["php-fpm7.3", "-F"]