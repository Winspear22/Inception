FROM debian:buster


# Mise à jour classique des packages 
RUN apt update -y
RUN apt upgrade -y

# installation de nginx et de openssl
RUN apt install nginx -y
RUN apt install openssl -y

# Je crée le fichier qui va accueillir a clé SSL
RUN mkdir -p /etc/nginx/ssl

# Je crée ma clée SSL
RUN openssl req -x509 -nodes \
	-keyout /etc/nginx/ssl/adaloui.42.fr.key \
	-out /etc/nginx/ssl/adaloui.42.fr.crt \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=adaloui.42.fr/UID=adaloui"

# Je crée un dossier qui va me servir à stocker tous mes fichiers de config de nginx
RUN mkdir -p /var/run/nginx

# Je copie colle mon fichier de configuration pour remplacer celui de nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf 

# Je m'assure de l'accès au dossier où le site sera contenu
RUN chmod 755 /var/www/html 
RUN chown -R www-data:www-data /var/www/html

# La connexion se fait sur le port 443
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]