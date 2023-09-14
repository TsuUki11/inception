FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install mariadb-server -y

COPY ./tools/ /scripts

CMD ["bash", "/scripts/run_scripts.sh"]