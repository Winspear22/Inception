FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#ARG ROOT_IN_MARIADB 
#ARG ROOT_PASSWORD_IN_MARIADB
#ARG USER_IN_MARIADB
#ARG USER_PASSWORD_IN_MARIADB 
#ARG DATABASE_IN_MARIADB

#COPY ./conf/mariadb_data_creation.sql /

#RUN mysql < mariadb_data_creation.sql && rm -f mariadb_data_creation.sql

RUN service mysql start

#RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
#RUN chown -R mysql:mysql /var/run/mysqld
#RUN chmod 755 /var/run/mysqld/mysqld.sock
#RUN touch /var/run/mysqld/mysqld.sock
#RUN touch /var/run/mysqld/mysqld.pid
#RUN chown -R mysql:mysql /var/run/mysqld/mysqld.sock
#RUN chown -R mysql:mysql /var/run/mysqld/mysqld.pid
# chmod -R 755 /var/run/mysqld/mysqld.sock
#RUN mysql -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_IN_MARIADB};"
#RUN mysql -e "CREATE USER IF NOT EXISTS '${USER_IN_MARIADB}'@'%' IDENTIFIED by '${USER_PASSWORD_IN_MARIADB}';"
#RUN mysql -e "GRANT ALL PRIVILEGES ON ${DATABASE_IN_MARIADB}.* TO '${USER_IN_MARIADB}'@'%';"
#RUN mysql -e "ALTER USER '${ROOT_IN_MARIADB}'@'localhost' IDENTIFIED by '${ROOT_PASSWORD_IN_MARIADB}';"
#RUN mysql -u root -p${ROOT_PASSWORD_IN_MARIADB} -e "FLUSH PRIVILEGES;"
#RUN service mysql restart

#RUN service mysql start \
#&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
#&& chown -R mysql:mysql /var/run/mysqld/mysqld.sock \
#&& chown -R mysql:mysql /var/run/mysqld/mysqld.pid \
#&& chmod -R 644 /var/run/mysqld/mysqld.sock \
#&& mysql -e "CREATE DATABASE IF NOT EXISTS ${DATABASE_IN_MARIADB};" \
#&& mysql -e "CREATE USER IF NOT EXISTS '${USER_IN_MARIADB}'@'%' IDENTIFIED by '${USER_PASSWORD_IN_MARIADB}';" \
#&& mysql -e "GRANT ALL PRIVILEGES ON ${DATABASE_IN_MARIADB}.* TO '${USER_IN_MARIADB}'@'%';" \
#&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${ROOT_PASSWORD_IN_MARIADB}';" \
#&& mysql -u root -p${ROOT_PASSWORD_IN_MARIADB} -e "FLUSH PRIVILEGES;" \
#&& service mysql restart

EXPOSE 3306
#CMD ["mysql_safe"]