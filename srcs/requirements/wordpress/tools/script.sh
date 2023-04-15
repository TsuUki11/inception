#!/bin/bash

sed -i "s+/run/php/php7.3-fpm.sock+0.0.0.0:9000+g" /etc/php/7.3/fpm/pool.d/www.conf

wp core download --path=/var/www/html/wordpress --allow-root

while ! wp config create --dbname=$WORDPRESS_DB_NAME \
                         --dbuser=$WORDPRESS_DB_USER \
                         --dbpass=$WORDPRESS_DB_PASSWORD \
                         --dbhost=mariadb \
                         --path=/var/www/html/wordpress \
                         --allow-root && ! cat /var/www/html/wordpress/wp-config.php; do
    sleep 3
done

wp core install --url=127.0.0.1 --title=inception --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --path=/var/www/html/wordpress --allow-root

#redis :///////////////////////////////////////////
sed -i "s+# maxmemory <bytes>+maxmemory 128M+g" /etc/redis/redis.conf
sed -i "s+# maxmemory-policy noeviction+maxmemory-policy allkeys-lfu+" /etc/redis/redis.conf
sed -i "s+127.0.0.1+0.0.0.0+g" /etc/redis/redis.conf

wp config set WP_REDIS_HOST redis --path=/var/www/html/wordpress/ --allow-root wp config set WP_REDIS_PORT 6379 --raw --path=/var/www/html/wordpress/ --allow-root
wp plugin install redis-cache --activate --path=/var/www/html/wordpress/ --allow-root

# service redis-server start

wp redis enable --path=/var/www/html/wordpress --allow-root
wp user create TOM tom@gmail.com --role=author --path=/var/www/html/wordpress --allow-root

echo DONE!!!!!!!!!!!
php-fpm7.3 -F