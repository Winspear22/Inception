FROM debian:buster

# ETAPE 1 - INSTALLATION DES PACKAGES NECESSAIRES :
# INSTALLATION DE L'INTEGRALITE DES PACKAGES DE PHP POUR ETRE CERTAIN D'EN POSSEDER TOUTES LES APTITUDES, SINON, PHP RISQUE D'AFFICHER DES PAGES BLANCHES
# INSTALLATION DU CLIENT MARIADB DANS LE DOCKER WORDPRESS POUR POUVOIR DIALOGUER AVEC LE SERVEUR MARIADB DANS LE DOCKER MARIADB

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install php7.3 -y
RUN	apt-get install php-fpm -y 
RUN	apt-get install php-cli -y
RUN	apt-get install php-common -y
RUN	apt-get install php7.3-mbstring -y
RUN	apt-get install php-xmlrpc -y
RUN	apt-get install php-soap -y
RUN	apt-get install php-intl -y
RUN	apt-get install php-mysql -y
RUN	apt-get install php-ldap -y
RUN	apt-get install php-zip -y
RUN	apt-get install php-curl -y
RUN	apt-get install php-opcache -y 
RUN	apt-get install php-readline -y
RUN	apt-get install php-xml -y
RUN	apt-get install php-gd -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y
RUN rm /etc/php/7.3/fpm/pool.d/www.conf

# ETAPE 2 : CREATION DU DOSSIER WORDPRESS ET CLES D'ACCES AUX DOSSIERS VAR/WWW/HTML
# LE DOSSIER WORDPRESS VA SERVIR A ACCUEILLIR LE PACKAGE WORDPRESS QUI SERA UTILISE POUR AFFICHER NOTRE SITE ET A ETRE SAUVEGARDE DANS LE VOLUME
# CHMOD ET CHOWN POUR DONNER ACCES AUX DOSSIERS VAR/WWW/HTML
RUN mkdir -p /var/www/html/wordpress
RUN chmod 777 /var/www/html
RUN chown -R www-data:www-data /var/www/html/

# ETAPE 3 : TELECHARGEMENT DE WORDPRESS ET DECOMPRESSEMENT DE CE DERNIER
# JE TELECHARGE AVEC WGET LE PACKAGE WORDPRESS (AUTRE METHODE DISPONIBLE AVEC wp core download MAIS NECESSITE LE CLI)
# JE DECOMPRESSE LE DOSSIER ET LE DEPLACE DANS VAR/WWW/HTML 
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz 
RUN chmod 755 wordpress-6.0-fr_FR.tar.gz
RUN tar -xzf wordpress-6.0-fr_FR.tar.gz
RUN rm wordpress-6.0-fr_FR.tar.gz
RUN mv wordpress ./var/www/html/

# ETAPE 4 : IMPORTATION DU SCRIPT .SH ET DU FICHIER DE CONFIGURATION DE WORDPRESS
# COPIE DU SCRIPT.SH QUI VA CONFIGURER WORDPRESS
# JE DONNE LA PERMISSION D'EXECUTER LE FICHIER (ON PEUT AUSSI UTILISER CHMOD -X)
COPY ./conf/script.sh ./
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 755 ./script.sh

# ETAPE 5 : TELECHARGEMENT DE WP-CLI QUI SERT A UTILISER LES COMMANDES WORDPRESS
# JE WGET CLI ET DONNE LES PERMISSIONS D'EXECUTION A 755 POUR LE FICHIER WP-CLI.PHAR
# ON LE DEPLACE DANS LES BINAIRES POUR QUE LES COMMANDES SOIENT EXECUTABLES
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 755 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# ETAPE 6 : JE METS L'EXPOSE SUR LE PORT 9000, CELUI DE WORDPRESS
EXPOSE 9000


# ETAPE 7 : JE LANCE LE SCRIPT QUI CONFIGUERRA WORDPRESS
CMD ["sh", "script.sh"]