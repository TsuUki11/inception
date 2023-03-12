#! /bin/bash

# sed -i "s+= mysql+= root+" /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

bash /scripts/config_mysql.sh

# service mysql stop && mysqld