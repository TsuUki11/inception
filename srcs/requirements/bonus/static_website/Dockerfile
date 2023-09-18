FROM debian:buster

RUN	apt-get update && apt-get upgrade

RUN apt-get install nginx -y

COPY ./conf/server.conf /etc/nginx/conf.d/

COPY ./tools/profile-master /profile-master

CMD ["nginx", "-g", "daemon off;"]