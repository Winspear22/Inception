FROM debian:buster

RUN echo "\033[1;36m========================================\033[0m" \
&& echo "\033[1;37mINSTALLING NOW WORDPRESS WITH DOCKERFILE\033[0m" \
&& echo "\033[1;36m========================================\033[0m"

RUN echo "\033[0;36m==============================================\033[0m" \
&&  echo "\033[0;37mUPDATING AND UPGRADING THE WORDPRESS CONTAINER\033[0m" \
&&  echo "\033[0;36m==============================================\033[0m"
RUN apt-get update -y
RUN apt-get upgrade -y

RUN echo "\033[0;36m=======================================================================\033[0m" \
&&  echo "\033[0;37mINSTALLING WGET, PHP7.3, PHP-FMP, PHP-MYSQL AND MARIADB CLIENT PACKAGES\033[0m" \
&&  echo "\033[0;36m=======================================================================\033[0m"

RUN apt-get install wget -y
RUN apt-get install php7.3 -y
RUN	apt-get install php-fpm -y 
#RUN	apt-get install php-cli -y
#RUN	apt-get install php-common -y
#RUN	apt-get install php7.3-mbstring -y
#RUN	apt-get install php-xmlrpc -y
#RUN	apt-get install php-soap -y
#RUN	apt-get install php-intl -y
#RUN	apt-get install php-mysql -y
#RUN	apt-get install php-ldap -y
#RUN	apt-get install php-zip -y
#RUN	apt-get install php-curl -y
#RUN	apt-get install php-opcache -y 
#RUN	apt-get install php-readline -y
#RUN	apt-get install php-xml -y
#RUN	apt-get install php-gd -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y
RUN rm /etc/php/7.3/fpm/pool.d/www.conf

RUN echo "\033[0;36m============================================\033[0m" \
&&  echo "\033[0;37mCOPYING WORDPRESS CONFIG FILE AND OUR SCRIPT\033[0m" \
&&  echo "\033[0;36m============================================\033[0m"
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/script.sh ./
RUN chmod 755 ./script.sh

RUN echo "\033[0;36m==========================\033[0m" \
&&  echo "\033[0;37mDOWNLOADING WP-CLI PACKAGE\033[0m" \
&&  echo "\033[0;36m==========================\033[0m"

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 755 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN echo "\033[0;36m===========\033[0m" \
&&  echo "\033[0;37mEXPOSE 9000\033[0m" \
&&  echo "\033[0;36m===========\033[0m"

EXPOSE 9000

RUN echo "\033[0;36m==============================\033[0m" \
&&  echo "\033[0;37mLAUNCHING THE SCRIPT SCRIPT.SH\033[0m" \
&&  echo "\033[0;36m==============================\033[0m"
CMD ["./script.sh"]
