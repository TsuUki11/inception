FROM debian:buster

RUN apt update

RUN apt upgrade

RUN apt install vsftpd -y

RUN mkdir -p /var/www/html

# COPY ./config/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/script.sh /script.sh

CMD [ "bash", "/script.sh" ]