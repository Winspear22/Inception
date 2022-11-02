FROM debian:buster

# Wordpress est un systeme de gestion ecrit en PHP

# ETAPE 1 :
# - Installation des outils wget pour installer wordpress
# - Installation de PHP-FPM et toutes ses dependances

RUN apt-get update -y && apt-get upgrade -y \
&& apt-get install -y wget \
&& apt-get install -y php7.3 php7.3-fpm php-cli php-common php7.3-mbstring php-xmlrpc php-soap php-intl php-mysql php-ldap php-zip php-curl php-opcache php-readline php-xml php-gd \
&& apt-get install -y mariadb-client \
&& rm /etc/php/7.3/fpm/pool.d/www.conf

# ETAPE 2 :
# - Importer les fichier de configuration et le script entrypoint.sh depuis notre machine host vers notre conteneur

COPY ./conf/script.sh ./
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x ./script.sh

EXPOSE 9000

# ETAPE 3 :
# - Lancer le script bash entrypoint.sh à l'interieur du conteneur (installation de wordpress)

ENTRYPOINT ["./script.sh"]
