#echo 'stty stop undef <$TTY >$TTY' > .zshrc
service mysql start 
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld/mysqld.sock
chown -R mysql:mysql /var/run/mysqld/mysqld.pid
chmod -R 644 /var/run/mysqld/mysqld.sock
mysql < script_db_creation.sql
mysqld_safe