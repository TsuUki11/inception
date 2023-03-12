FROM debian:buster

RUN	apt update && apt upgrade

RUN	apt	install nginx -y

RUN rm -rf /etc/nginx/nginx.conf

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]