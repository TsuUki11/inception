#!/bin/bash

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';"

mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"

mysql -u root -e "FLUSH PRIVILEGES;"


# CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED by '$DB_PASSWORD';
# GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';