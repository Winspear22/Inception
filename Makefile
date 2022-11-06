
all: up

up :	
	cd srcs && sudo service docker restart \
	&& sudo docker-compose -f docker-compose.yml build \
	&& sudo docker-compose -f docker-compose.yml up -d

down :
	cd srcs && sudo docker-compose -f docker-compose.yml down

clean: 
	cd srcs && sudo docker-compose -f docker-compose.yml down \
	&& sudo docker system prune --force

clean-all:	
	cd srcs && sudo docker-compose -f docker-compose.yml down \
	&& sudo docker system prune -a --force \
	&& sudo rm -Rf /home/adaloui/data/*

re:	clean up

show:
	sudo docker container ps -a

nginx:
	sudo docker exec -it nginx bash -l

mariadb:
	sudo docker exec -it mariadb bash -l

wordpress:
	sudo docker exec -it wordpress bash -l

site:
	sudo docker exec -it site bash -l

config:
	cd srcs && sudo docker-compose config
delete:
	cd srcs && sudo docker-compose down --remove-orphans && sudo docker system prune --force

volume_show:
	cd /home/adaloui/data && sudo ls -l **

volume_delete:
	sudo rm -Rf /home/adaloui/data/*

up_nginx:
	cd srcs && sudo docker-compose up --build nginx
up_mariadb:
	cd srcs && sudo docker-compose up --build mariadb
up_wordpress:
	cd srcs && sudo docker-compose up --build wordpress
up_site:
	cd srcs && sudo docker-compose up --build site

.PHONY: up down re clean clean-all show nginx mariadb wordpress config \
delete volume_show volume_delete \
up_nginx up_mariadb up_wordpress up_site 