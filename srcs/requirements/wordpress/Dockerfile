FROM debian:buster

RUN apt update && apt upgrade

RUN deluser www-data

RUN useradd -m -p "$WWW_DATA_USER_PASS" www-data

RUN mkdir -p /var/www/html

# RUN apt install lsb-release -y

# RUN apt install -y gnupg ca-certificates apt-transport-https wget

# RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

# RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

# RUN apt update

RUN apt install php7.3-cli php7.3-fpm php-mysql php7.3-json php7.3-opcache php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl mariadb-client wget -y

#redis instalation

RUN apt install redis-server php-redis -y

COPY ./tools/script.sh script.sh

RUN mkdir -p /run/php

RUN touch /run/php/php7.3-fpm.pid

RUN chown -R www-data: /run/php

RUN apt install curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN apt install less sendmail -y

COPY ./conf/php.ini /php.ini

CMD ["bash", "script.sh"]

# 9d4aeb674a17