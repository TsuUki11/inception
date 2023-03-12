#!/bin/bash

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" /var/www/html/wordpress/wp-config.php

sed -i "s/username_here/$WORDPRESS_DB_USER/g" /var/www/html/wordpress/wp-config.php

sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" /var/www/html/wordpress/wp-config.php

sed -i "s+/run/php/php7.3-fpm.sock+9099+" /etc/php/7.3/fpm/pool.d/www.conf