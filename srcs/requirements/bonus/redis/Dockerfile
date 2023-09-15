FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install redis-server php-redis php-mysql curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/script.sh script.sh

# RUN rm -rf /etc/redis/redis.conf

# COPY ./tools/redis.conf /etc/redis/redis.conf

RUN chmod +x script.sh

CMD [ "bash", "script.sh" ]