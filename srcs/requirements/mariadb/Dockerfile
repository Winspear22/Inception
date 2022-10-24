FROM debian:buster



#ARG ROOT_IN_MARIADB
#ARG ROOT_PASSWORD_IN_MARIADB
#ARG USER_IN_MARIADB
#ARG USER_PASSWORD_IN_MARIADB
#ARG DATABASE_IN_MARIADB


RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY /conf/script.sh /etc/../script.sh
#COPY /conf/script_db_creation.sql .

#RUN chmod 755 /script.sh
#RUN service mysql start 

RUN service mysql start \
&& service mysql status \
&& sleep 10 \
&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.sock \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.pid \
&& chmod -R 644 /var/run/mysqld/mysqld.sock \
&& mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" \
&& mysql -e "CREATE USER IF NOT EXISTS 'adaloui'@'%' IDENTIFIED BY 'popo';" \
&& mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'adaloui'@'%' IDENTIFIED BY 'popo';" \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpopo';" \
&& service mysql restart

#&& mysql -e "FLUSH PRIVILEGES;"
#RUN service mysql start
#RUN chown -R root:root /var/lib/mysql /var/run/mysqld
#RUN chown -R root:root /var/run/mysqld/mysqld.sock
#RUN chown -R root:root /var/run/mysqld/mysqld.pid
#RUN chmod -R 644 /var/run/mysqld/mysqld.sock
#&& mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"
#&& mysql -e "CREATE USER IF NOT EXISTS 'adaloui'@'%' IDENTIFIED BY 'popo'";
#&& mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'adaloui'@'%' IDENTIFIED BY 'popo'";
#&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpopo'";
#&& mysql -e "FLUSH PRIVILEGES;"
#&& mysqladmin -u root -prootpopo shutdown
EXPOSE 3306

#CMD ["sh", "script.sh"]

#ENTRYPOINT ["/script.sh"]

CMD ["mysqld_safe"]