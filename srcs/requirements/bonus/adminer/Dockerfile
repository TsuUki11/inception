FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install php7.3-fpm -y

COPY ./tools/script.sh script.sh

RUN chmod +x script.sh

CMD ["bash", "script.sh"]