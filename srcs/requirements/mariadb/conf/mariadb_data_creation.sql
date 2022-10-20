/*CREATE DATABASE IF NOT EXISTS ${DATABASE_IN_MARIADB};
CREATE USER IF NOT EXISTS '${USER_IN_MARIADB}'@'%' IDENTIFIED by '${USER_PASSWORD_IN_MARIADB}';
GRANT ALL PRIVILEGES ON ${DATABASE_IN_MARIADB}.* TO '${USER_IN_MARIADB}'@'%';
FLUSH PRIVILEGES;
ALTER USER '${ROOT_IN_MARIADB}'@'localhost' IDENTIFIED by '${ROOT_PASSWORD_IN_MARIADB}';
*/

CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'adaloui'@'%' IDENTIFIED BY 'popo';
GRANT ALL PRIVILEGES ON wordpress.* TO 'adaloui'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'user42';