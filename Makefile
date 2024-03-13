# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yuboktae <yuboktae@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 13:05:01 by yuboktae          #+#    #+#              #
#    Updated: 2024/03/13 20:28:42 by yuboktae         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE = ./srcs/docker-compose.yml
DC = docker compose
DOCKER_PS_QA := $(shell docker ps -qa)
DOCKER_IMAGES_QA := $(shell docker images -qa)
DOCKER_VOLUMES_QA := $(shell docker volume ls -q)
DOCKER_NETWORKS_QA := $(shell docker network ls -q)


all: build up
build:
	$(DC) -f $(COMPOSE_FILE) build
up:
	$(DC) -f $(COMPOSE_FILE) up -d
create_vol:
	mkdir -p $(HOME)/data/db
	mkdir -p $(HOME)/data/wp
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 755 $(HOME)/data
	
down:
	$(DC) -f $(COMPOSE_FILE) down

clean:
	@docker stop $(DOCKER_PS_QA); \
	docker rm $(DOCKER_PS_QA); \
	docker rmi -f $(DOCKER_IMAGES_QA); \
	docker volume rm $(DOCKER_VOLUMES_QA); \
	docker network rm $(DOCKER_NETWORKS_QA) 2>/dev/null;

.PHONY: all build down clean
