all: build

up:
	docker compose -f ./srcs/docker-compose.yml up --build -d

build:
	docker compose -f ./srcs/docker-compose.yml build

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	docker compose -f ./srcs/docker-compose.yml down --rmi all
	docker compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	docker system prune -f

fclean: clean
	sudo rm -fr /home/aelbouaa/data/mariadb-volume/*
	sudo rm -fr /home/aelbouaa/data/wordpress-volume/*