FROM debian:buster

RUN apt update && apt upgrade

RUN apt install redis -y

COPY ./tools/script.sh script.sh

CMD ["bash", "script.sh"]