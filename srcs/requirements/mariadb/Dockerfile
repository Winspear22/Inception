FROM debian:buster

RUN echo "\033[1;36m======================================\033[0m" \
&&  echo "\033[1;37mINSTALLING NOW MARIADB WITH DOCKERFILE\033[0m" \
&&  echo "\033[1;36m======================================\033[0m"

RUN echo "\033[0;36m============================================\033[0m" \
&&  echo "\033[0;37mUPDATING AND UPGRADING THE MARIADB CONTAINER\033[0m" \
&&  echo "\033[0;36m============================================\033[0m"
RUN apt update -y
RUN apt upgrade -y

RUN echo "\033[0;36m=====================================\033[0m" \
&&  echo "\033[0;37mDOWNLOADING MARIADB SERVER AND CLIENT\033[0m" \
&&  echo "\033[0;36m=====================================\033[0m"
RUN apt-get install mariadb-server -y
RUN apt-get install mariadb-client -y
RUN echo "\033[0;36m=======================================================\033[0m" \
&&  echo "\033[0;37mCOPYING THE SERVER CONFIGURATION INTO MARIADB DIRECTORY\033[0m" \
&&  echo "\033[0;36m=======================================================\033[0m"
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN echo "\033[0;36m=====================================\033[0m" \
&&  echo "\033[0;37mTAKING THE .ENV INTO ACCOUNT WITH ARG\033[0m" \
&&  echo "\033[0;36m=====================================\033[0m"

ARG MDB_DATABASE
ARG MDB_ADMIN
ARG MDB_MDP
ARG MDB_ROOT_MDP

RUN echo "\033[0;36m===========================================\033[0m" \
&&  echo "\033[0;37mLAUNCHING MYSQL, CREATING DATABASE AND USER\033[0m" \
&&  echo "\033[0;36m===========================================\033[0m"

RUN service mysql start \
&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.sock \
&& chown -R mysql:mysql /var/run/mysqld/mysqld.pid \
&& chmod -R 644 /var/run/mysqld/mysqld.sock \
&& mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_DATABASE};" \
&& mysql -e "CREATE USER IF NOT EXISTS '${MDB_ADMIN}'@'%' IDENTIFIED by '${MDB_MDP}';" \
&& mysql -e "GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_ADMIN}'@'%';" \
&& mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MDB_ROOT_MDP}';" \
&& mysql -u root -p${MDB_ROOT_MDP} -e "FLUSH PRIVILEGES;"

RUN echo "\033[0;36m===========\033[0m" \
&&  echo "\033[0;37mEXPOSE 3306\033[0m" \
&&  echo "\033[0;36m===========\033[0m"
EXPOSE 3306

RUN echo "\033[0;36m===============\033[0m" \
&&  echo "\033[0;37mLAUNCHING MYSQL\033[0m" \
&&  echo "\033[0;36m===============\033[0m"

CMD ["mysqld_safe"]