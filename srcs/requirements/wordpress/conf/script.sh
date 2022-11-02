#!/bin/bash

sleep 5

mkdir -p /var/www/html/wordpress
chmod 777 /var/www/html
chown -R www-data:www-data /var/www/html/
cd /var/www/html/wordpress/

wp core download --allow-root --locale=fr_FR

if [ ! -f /var/www/html/wordpress/wp-config.php ];
then
	wp config create --allow-root --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=mariadb:3306 --path='/var/www/html/wordpress'
fi

wp core install --allow-root --url=https://adaloui.42.fr --title="Inception" --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL}

wp user create --allow-root ${WORDPRESS_USER_2} ${WORDPRESS_USER_2_EMAIL} --role=author --user_pass=${WORDPRESS_USER_2_MDP}

wp theme install twentyseventeen --activate --allow-root
wp cache flush --allow-root

mkdir /run/php

exec /usr/sbin/php-fpm7.3 -F -R
