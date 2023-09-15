FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install curl gnupg -y

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get install nodejs -y

RUN npx -y create-react-app keep_running

COPY ./tools/script.sh /script.sh


CMD ["bash", "/script.sh"];