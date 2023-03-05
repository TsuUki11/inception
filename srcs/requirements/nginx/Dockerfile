FROM alpine

COPY . /nginx

RUN apk update

RUN apk add nginx

RUN apk add openssl

CMD [ "nginx" ]