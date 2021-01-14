sudo docker network create -d bridge --subnet=172.75.0.0/24 network4

sudo docker rm -f mariadbt

sudo docker rm -f pmat

sudo docker rm -f mongot

sudo docker pull mariadb:10.5.8

sudo docker pull phpmyadmin:5.0.4

sudo docker pull mongo:4.4-bionic

sudo docker run --name mariadbt \
	--network=network4 \
	--restart=always \
	-p 3310:3306 \
	-e MYSQL_ROOT_PASSWORD=1234@ \
	-d mariadb:10.5.8

sudo docker run --name pmat \
	--network=network4 \
	--restart=always \
	-p 8048:80 \
	--link mariadb:db \
	-d phpmyadmin:5.0.4 

sudo docker run --name mongot \
	--network=network4 \
	--restart=always \
	-p 4549:27017 \
	-e MONGO_INITDB_ROOT_USERNAME=admin \
	-e MONGO_INITDB_ROOT_PASSWORD=1234@ \
	-d mongo:4.4-bionic
