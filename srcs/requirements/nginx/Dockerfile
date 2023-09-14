FROM debian:buster

RUN	apt-get update && apt-get upgrade

RUN	apt-get	install nginx -y

RUN rm -rf /etc/nginx/nginx.conf

RUN apt-get install openssl

RUN mkdir /etc/nginx/ssl

RUN openssl genpkey -algorithm RSA -out inception.key

RUN openssl req -new -key inception.key -out inception.csr -subj "/C=/ST=/L=/O=/CN=/emailAddress="

RUN openssl x509 -req -in inception.csr -signkey inception.key -out inception.crt

RUN mv inception.* /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]