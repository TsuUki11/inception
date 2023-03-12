FROM debian:buster

RUN apt update

RUN apt upgrade

RUN apt install mariadb-server -y

COPY ./tools/ /scripts

# RUN mysql_install_db

# RUN mkdir -p /var/run/mysqld/

# CMD ["sed", "-i", "'s+= mysql+= root+'", "/etc/mysql/mariadb.conf.d/50-server.cnf"]

# RUN sed -i "s+= mysql+= root+" /etc/mysql/mariadb.conf.d/50-server.cnf

# CMD ["service", "mysql", "start", "&&", "bash", "/script", "&&", "service", "mysql", "stop", "&&", "mysqld"]

RUN bash /scripts/run_scripts.sh

CMD ["mysqld"]