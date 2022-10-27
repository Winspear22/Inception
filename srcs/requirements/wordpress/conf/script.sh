#!/bin/bash

# JE LAISSE LE TEMPS A MYSQL DE SE LANCER
sleep 10

# ETAPE TRES IMPORTANTE, J'ORDONNE AU SHELL DE SE RENDRE DANS MON DOSSIER WORDPRESS
# IL FAUT QU'ON SOIT DANS LE DOSSIER OU SE TROUVE LE WP-CONFIG ET LE WP-SETTINGS SINON, TOUTES MES COMMANDES WP NE MARCHERONT PAS
cd /var/www/html/wordpress/

# JE DEMANDE SI WP-CONFIG EST CREE, SI NON JE LE CREE SPECIFIQUEMENT DANS LE DOSSIER WORDPRESS
# AVEC LES CRITERES DEMANDES
if [ ! -f /var/www/html/wordpress/wp-config.php ];
then
    wp config create --allow-root --dbname=wordpress --dbuser=adaloui --dbpass=popo --dbhost=mariadb:3306 --path='/var/www/html/wordpress'
fi
# JE SUPPRIME LE FICHIER EXEMPLE, CAR WORDPRESS CONFOND LE NOTRE ET L'EXEMPLE
rm -Rf wp-config-sample.php
# CONFIGURATION AUTMATIQUE DU SITE
wp core install --allow-root --url=https://adaloui.42.fr --title="Inception" --admin_user=adaloui --admin_password=popo --admin_email=adaloui@student.42.fr
# CREATION DE NOTRE DEUXIEME UTILISATEUR CAR C'EST DEMANDE DANS LE SUJET
wp user create --allow-root user user@user.42.fr --role=author --user_pass=user
# J'INSTALLE MON THEME : J'AI CHOISU LE TWENTYSEVENTEEN
wp theme install twentyseventeen --activate --allow-root
# JE VALIDE TOUTES MES MODIFICATIONS AVEC UN FLUSH
wp cache flush --allow-root
# JE LANCE PHP-FPM AFIN QU'IL PUISSE TOURNER EN PARALLELE DE MON WORDPRESS ET COMMUNIQUER AVEC NGINX COMME DEMANDE DANS LE SUJET
if [ ! -f /run/php ];
then
    mkdir /run/php
fi
echo "Wordpress est prêt"
exec /usr/sbin/php-fpm7.3 -F -R
