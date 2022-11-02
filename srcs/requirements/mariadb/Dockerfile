FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ARG MARIADB_DATABASE
ARG MARIADB_USER
ARG MARIADB_PASSWORD
ARG MARIADB_ROOT_PASSWORD

RUN service mysql start \
&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.sock \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.pid \
&& chmod -R 644 /var/run/mysqld/mysqld.sock \
&& mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci;" \
&& mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED by '${MARIADB_PASSWORD}';" \
&& mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';" \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MARIADB_ROOT_PASSWORD}';" \
&& mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;" \
&& service mysql restart

EXPOSE 3306

CMD ["mysqld_safe"]