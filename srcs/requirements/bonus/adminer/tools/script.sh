#! /bin/bash

if [ ! -d "/var/www/html/wordpress/adminer" ]; then

mkdir -p /var/www/html/wordpress/adminer

wget "http://www.adminer.org/latest.php" -O /var/www/html/wordpress/adminer/adminer.php

fi

php -S localhost:1457