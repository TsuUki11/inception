#! /bin/bash

if [ ! -f "/var/www/html/adminer/adminer.php" ]; then

mkdir -p /var/www/html/adminer

wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/adminer.php

fi

php -S localhost:1457