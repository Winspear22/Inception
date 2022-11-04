
all: up

up :	
	cd srcs && sudo service docker restart \
	&& sudo docker-compose -f docker-compose.yml build \
	&& sudo docker-compose -f docker-compose.yml up -d

down :
	cd srcs && sudo docker-compose -f docker-compose.yml down

clean: cd srcs && sudo docker-compose -f docker-compose.yml down \
	&& sudo docker system prune -a --force

clean-all:	
	cd srcs && sudo docker-compose -f docker-compose.yml down \
	&& sudo docker system prune -a --force \
	&& sudo docker volume rm srcs_mariadb srcs_wp-files

re:	clean up

show:
	sudo docker container ps -a

nginx:
	sudo docker exec -it nginx bash -l

mariadb:
	sudo docker exec -it mariadb bash -l

wordpress:
	sudo docker exec -it wordpress bash -l

config:
	cd srcs && sudo docker-compose config
delete:
	cd srcs && sudo docker-compose down --remove-orphans --volumes && sudo docker system prune --force

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


.PHONY: up down re clean show nginx mariadb wordpress config delete volume_show volume_delete \
up_nginx up_mariadb up_wordpress
