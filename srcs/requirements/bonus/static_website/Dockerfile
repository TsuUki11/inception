FROM debian:buster

RUN apt-get update && apt-get upgrade

RUN apt-get install curl gnupg -y

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get install nodejs -y

RUN npx -y create-react-app about-me

COPY ./tools/script.sh /script.sh

RUN rm -rf /about-me/public/index.html

COPY ./tools/profile-master /profile-master

# RUN chmod +x script.sh

CMD ["bash", "/script.sh"];