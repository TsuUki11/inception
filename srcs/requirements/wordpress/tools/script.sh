#!/bin/bash

sed -i "s+/run/php/php7.3-fpm.sock+0.0.0.0:9000+g" /etc/php/7.3/fpm/pool.d/www.conf

# define('WP_CACHE_KEY_SALT', 'example.com');
# define('WP_CACHE', true);
# define('WP_REDIS_CLIENT', 'pecl');
# define('WP_REDIS_SENTINEL', '');
# define('WP_REDIS_SERVERS', 'tcp://127.0.0.1:6379');
# define('WP_REDIS_PASSWORD', '');
# define('WP_REDIS_DATABASE', 0);

wp core download --path=/var/www/html/wordpress --allow-root

while ! wp config create --dbname=$WORDPRESS_DB_NAME \
                         --dbuser=$WORDPRESS_DB_USER \
                         --dbpass=$WORDPRESS_DB_PASSWORD \
                         --dbhost=mariadb \
                         --path=/var/www/html/wordpress \
                         --allow-root && ! cat /var/www/html/wordpress/wp-config.php; do
    sleep 3
done


# wp config set WP_REDIS_HOST 0.0.0.0 --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_REDIS_PORT 6379 --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_CACHE_KEY_SALT https://127.0.0.1 --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_REDIS_CLIENT predis --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_REDIS_SCHEME tcp --path=/var/www/html/wordpress/ --allow-root

#redis //////////////////////////////////////////////////////////
# wp config set WP_CACHE_KEY_SALT 127.0.0.1 --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_CACHE "true" --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_REDIS_CLIENT "pecl" --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_REDIS_SENTINEL "" --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_REDIS_SERVERS "tcp://0.0.0.0:6379" --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_REDIS_PASSWORD "" --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_REDIS_DATABASE 0 --path=/var/www/html/wordpress/ --allow-root
#redis //////////////////////////////////////////////////////////

wp core install --url=127.0.0.1 --title=inception --admin_user=admin --admin_password=admin --admin_email=hhkirito07@gmail.com --path=/var/www/html/wordpress --allow-root

#redis :///////////////////////////////////////////

# wp plugin install redis-object-cache --path=/var/www/html/wordpress/ --activate --allow-root
    wp config set WP_REDIS_HOST redis --path=/var/www/html/wordpress/ --allow-root 
  	wp config set WP_REDIS_PORT 6379 --raw --path=/var/www/html/wordpress/ --allow-root
 	# wp config set WP_CACHE_KEY_SALT https://127.0.0.1 --path=/var/www/html/wordpress/ --allow-root
 	# wp config set WP_REDIS_CLIENT predis --path=/var/www/html/wordpress/ --allow-root
    # wp config set WP_REDIS_SCHEME tcp --path=/var/www/html/wordpress/ --allow-root
wp plugin install redis-cache --activate --path=/var/www/html/wordpress/ --allow-root
# service redis-server start
wp redis enable --path=/var/www/html/wordpress --allow-root
    
    # wp plugin status redis-cache --allow-root

wp user create TOM tom@gmail.com --role=author --path=/var/www/html/wordpress --allow-root

echo DONE!!!!!!!!!!!
php-fpm7.3 -F