FROM debian:buster

RUN echo "\033[1;36m====================================\033[0m" \
&& echo "\033[1;37mINSTALLING NOW NGINX WITH DOCKERFILE\033[0m" \
&& echo "\033[1;36m====================================\033[0m"
# Mise à jour classique des packages 
RUN echo "\033[0;36m==========================================\033[0m" \
&&  echo "\033[0;37mUPDATING AND UPGRADING THE NGINX CONTAINER\033[0m" \
&&  echo "\033[0;36m==========================================\033[0m"
RUN apt update -y
RUN apt upgrade -y
RUN echo "\033[0;36m=====================================\033[0m" \
&&  echo "\033[0;37mINSTALLING NGINX AND OPENSSL PACKAGES\033[0m" \
&&  echo "\033[0;36m=====================================\033[0m"
# installation de nginx et de openssl
RUN apt install nginx -y
RUN apt install openssl -y
RUN echo "\033[0;36m============================================================\033[0m" \
&&  echo "\033[0;37mCREATING THE DIRECTORY THAT WILL CONTAIN THE SSL KEY AND CRT\033[0m" \
&&  echo "\033[0;36m============================================================\033[0m"
# Je crée le fichier qui va accueillir a clé SSL
RUN mkdir -p /etc/nginx/ssl
RUN echo "\033[0;36m=================================\033[0m" \
&&  echo "\033[0;37mCREATING THE SSL KEY WITH OPENSSL\033[0m" \
&&  echo "\033[0;36m=================================\033[0m"
# Je crée ma clée SSL
RUN openssl req -x509 -nodes \
	-keyout /etc/nginx/ssl/adaloui.42.fr.key \
	-out /etc/nginx/ssl/adaloui.42.fr.crt \
	-subj "/C=FR/ST=IDF/L=Paris/O=42_Company/OU=E3/CN=adaloui.42.fr/UID=adaloui"
#C = Country ST = Region L = Ville O = ton entreprise OU=Endroit CN=site UID=unique id 
# Je crée un dossier qui va me servir à stocker tous mes fichiers de config de nginx
RUN mkdir -p /var/run/nginx
RUN echo "\033[0;36m==============================================\033[0m" \
&&  echo "\033[0;37mCOPYING THE NGINX.CONF FILE IN NGINX DIRECTORY\033[0m" \
&&  echo "\033[0;36m==============================================\033[0m"
# Je copie colle mon fichier de configuration pour remplacer celui de nginx
COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf
RUN echo "\033[0;36m==================================================\033[0m" \
&&  echo "\033[0;37mGRANTING ACCESS TO HTML DIRECTORY TO STORE WEBSITE\033[0m" \
&&  echo "\033[0;36m==================================================\033[0m"
# Je m'assure de l'accès au dossier où le site sera contenu
RUN chmod 755 /var/www/html 
RUN chown -R www-data:www-data /var/www/html
# La connexion se fait sur le port 443
RUN echo "\033[0;36m=====================================\033[0m" \
&&  echo "\033[0;37mGRANTING ACCESS WITH PORT 443 - HTTPS\033[0m" \
&&  echo "\033[0;36m=====================================\033[0m"
EXPOSE 443
RUN echo "\033[0;36m===============\033[0m" \
&&  echo "\033[0;37mLAUNCHING NGINX\033[0m" \
&&  echo "\033[0;36m===============\033[0m"
CMD [ "nginx", "-g", "daemon off;" ]