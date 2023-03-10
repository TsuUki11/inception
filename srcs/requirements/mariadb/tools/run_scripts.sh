#! /bin/bash

sed -i "s+127.0.0.1+0.0.0.0+g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s+user                    = mysql+user                    = root+g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s+#port                   = 3306+port                    = 3306+g" /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

sleep 2

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';"

mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"

mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

mysqld_safe