FROM debian:buster

# RUN apt update && apt upgrade

# RUN apt install nginx -y

# RUN apt install vim -y

# RUN apt install wget -y

# RUN apt install mariadb-server -y

# RUN service mysql start

# # RUN mysql_secure_installation

# RUN apt install php7.3 php7.3-cli php7.3-fpm php7.3-mysql php7.3-json php7.3-opcache php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl -y

# RUN service start php7.3-fpm
apt install openssl

mkdir /etc/nginx/ssl

openssl genpkey -algorithm RSA -out inception.key -aes256
openssl req -new -key inception.key -out inception.csr "/C=$country/ST=$state/L=$city/O=$organization/CN=$domain/emailAddress=$email"
openssl x509 -req -in inception.csr -signkey inception.key -out inception.crt

mv inception.* /etc/nginx/ssl

apt install redis-server -y


6379

sed -i "s+# maxmemory <bytes>+maxmemory 64M+g" /etc/redis/redis.conf
sed -i "s+# maxmemory-policy noeviction+maxmemory-policy allkeys-lfu+" /etc/redis/redis.conf
service redis-server status