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

wp core install --url=127.0.0.1 --title=inception --admin_user=admin --admin_password=admin --admin_email=hhkirito07@gmail.com --path=/var/www/html/wordpress --allow-root

echo DONE!!!!!!!!!!!
php-fpm7.3 -F