FROM debian:buster

RUN apt update

RUN apt upgrade

RUN apt install mariadb-server -y

COPY ./tools/ /scripts

CMD ["bash", "/scripts/run_scripts.sh"]