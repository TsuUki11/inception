#! /bin/bash

sed -i "s+# maxmemory <bytes>+maxmemory 128M+g" /etc/redis/redis.conf
sed -i "s+# maxmemory-policy noeviction+maxmemory-policy allkeys-lfu+" /etc/redis/redis.conf
sed -i "s+protected-mode yes+protected-mode no+" /etc/redis/redis.conf
sed -i "s+127.0.0.1 ::1+0.0.0.0+" /etc/redis/redis.conf
# cd /var/www/html/wordpress/
# wp config set WP_REDIS_HOST redis --path=/var/www/html/wordpress/ --allow-root
# wp config set WP_REDIS_PORT 6379 --raw --path=/var/www/html/wordpress/ --allow-root
# wp plugin install redis-cache --activate --path=/var/www/html/wordpress/ --allow-root
# wp redis enable --path=/var/www/html/wordpress --allow-root

redis-server --protected-mode no
