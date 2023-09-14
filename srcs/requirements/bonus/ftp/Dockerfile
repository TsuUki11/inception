FROM debian:buster

RUN apt-get update

RUN apt-get upgrade

RUN apt-get install vsftpd -y

RUN mkdir -p /var/www/html

# COPY ./config/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/script.sh /script.sh

CMD [ "bash", "/script.sh" ]