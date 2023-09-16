all: build up

build:
	# mkdir -p /home/aaitoual/data/wordpress_volume /home/aaitoual/data/mariadb_volume
	docker-compose -f ./srcs/docker-compose.yml build

up:
	docker-compose -f ./srcs/docker-compose.yml up

stop:
	docker-compose -f ./srcs/docker-compose.yml down

clean: stop
	rm -rf /home/aaitoual/data/
	docker system prune -f -a

