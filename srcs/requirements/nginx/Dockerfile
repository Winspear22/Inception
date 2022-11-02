FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y \
&& apt-get install nginx -y && apt-get install openssl -y && apt-get install vim -y \
&& mkdir /etc/nginx/ssl \
&& openssl req -new -x509 -nodes -keyout /etc/nginx/ssl/adaloui.42.fr.key -out /etc/nginx/ssl/adaloui.42.fr.crt \
-subj "/CN=adaloui.42.fr/C=FR/ST=IDF/L=Paris/O=Ecole42/OU=Inception"
#&& rm /etc/nginx/sites-enabled/default \
#&& rm /etc/nginx/sites-available/default

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
