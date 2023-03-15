#!/bin/bash

sed -i "s+/run/php/php7.3-fpm.sock+0.0.0.0:9000+g" /etc/php/7.3/fpm/pool.d/www.conf

# cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

# sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" /var/www/html/wordpress/wp-config.php

# sed -i "s/username_here/$WORDPRESS_DB_USER/g" /var/www/html/wordpress/wp-config.php

# sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" /var/www/html/wordpress/wp-config.php

# sed -i "s/localhost/mariadb/g" /var/www/html/wordpress/wp-config.php
wp core download --path=/var/www/html/wordpress --allow-root

while ! wp config create --dbname=$WORDPRESS_DB_NAME \
                         --dbuser=$WORDPRESS_DB_USER \
                         --dbpass=$WORDPRESS_DB_PASSWORD \
                         --dbhost=mariadb \
                         --path=/var/www/html/wordpress \
                         --allow-root; do
    sleep 3
done

wp core install --url=http://127.0.0.1:3000 --title=inception --admin_user=admin --admin_password=admin --admin_email=hhkirito07@gmail.com --path=/var/www/html/wordpress --allow-root

echo DONE!!!!!!!!!!!
# wp option update siteurl $SITE_URL --allow-root --path="/var/www/html/wordpress"
# wp option update home $SITE_URL --allow-root --path="/var/www/html/wordpress"
php-fpm7.3 -F