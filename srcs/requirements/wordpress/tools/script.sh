#!/bin/bash
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp core download --path=/var/www/html --allow-root

cd /var/www/html

while ! wp config create --dbname=$WORDPRESS_DB_NAME \
                         --dbuser=$WORDPRESS_DB_USER \
                         --dbpass=$WORDPRESS_DB_PASSWORD \
                         --dbhost=mariadb \
                         --path=/var/www/html \
                         --allow-root && ! cat /var/www/html/wp-config.php; do
    sleep 3
done

wp core install --url=aaitoual.42.fr --title=inception --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --path=/var/www/html --allow-root

wp user create $WP_AUTHOR $AUTHOR_EMAIL --user_pass=$AUTHOR_PASSWD --role=author --path=/var/www/html --allow-root

echo DONE!!!!!!!!!!!
php-fpm7.3 -F