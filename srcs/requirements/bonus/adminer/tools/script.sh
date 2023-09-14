#! /bin/bash

if [ ! -f "/var/www/html/wordpress/adminer/adminer.php" ]; then

mkdir -p /var/www/html/wordpress/adminer

wget "http://www.adminer.org/latest.php" -O /var/www/html/wordpress/adminer/adminer.php

fi

php -S localhost:1457