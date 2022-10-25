FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install php7.3 -y
RUN	apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN chmod 755 /var/www/wordpress-6.0-fr_FR.tar.gz
RUN tar -xzf /var/www/wordpress-6.0-fr_FR.tar.gz -C /var/www/html
RUN rm /var/www/wordpress-6.0-fr_FR.tar.gz

#RUN mv wordpress /var/www/
#RUN chown -R root:root /var/www/wordpress
RUN mkdir -p /var/www/html/wordpress-files/
RUN chmod 777 /var/www/html
RUN chown -R www-data:www-data /var/www/html/

# PAS SUR POUR CELLE LA
RUN mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php 
#COPY conf/wp-config.php /var/www/wordpress/wp-config.php

COPY conf/wp-config.php /var/www/html/wordpress/wp-config.php
COPY conf/wp-config.php .

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/script.sh .

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
#Il trouve pas le wp-config dans le var/www/wordpress, on le met dans le fichier de la racine
#RUN mv /var/www/wordpress/wp-config.php .
EXPOSE 9000
CMD ["sh", "script.sh"]

#RUN sleep 100000