sleep 5

wp core download --allow-root --locale=fr_FR

if [ ! -f wp-config.php ];
then
    wp config create --allow-root --dbname=wordpress --dbuser=adaloui --dbpass=popo --dbhost=mariadb:3306 --path='/var/www/wordpress'
fi

wp core install --allow-root --url=https:/adaloui.42.fr --title="Inception" --admin_user=adaloui --admin_password=popo --admin_email=adaloui@student.42.fr

wp user create --allow-root user user@user.42.fr --role=author --user_pass=user

wp theme install twentyseventeen --activate --allow-root

wp cache flush --allow-root

if [ ! -f /run/php ];
then
    mkdir /run/php
fi

exec /usr/sbin/php-fpm7.3 -F -R
