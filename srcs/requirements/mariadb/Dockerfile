FROM debian:buster



ARG ROOT_IN_MARIADB
ARG ROOT_PASSWORD_IN_MARIADB
ARG USER_IN_MARIADB
ARG USER_PASSWORD_IN_MARIADB
ARG DATABASE_IN_MARIADB


RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY /conf/script.sh /etc/../script.sh
COPY /conf/script_db_creation.sql .

RUN chmod 755 /script.sh
RUN service mysql start 


EXPOSE 3306

CMD ["sh", "script.sh"]

#ENTRYPOINT ["/script.sh"]

#CMD ["mysqld_safe"]