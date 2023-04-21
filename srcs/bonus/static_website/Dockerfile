FROM debian:buster

RUN apt update && apt upgrade

RUN apt install curl gnupg -y

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt install nodejs -y

RUN npx -y create-react-app my-about-me

COPY ./tools/script.sh /script.sh

CMD ["bash", "/script.sh"];