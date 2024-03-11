# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yuboktae <yuboktae@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 13:05:01 by yuboktae          #+#    #+#              #
#    Updated: 2024/03/11 17:20:43 by yuboktae         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE := ./srcs/docker-compose.yml
DC := docker compose

create_vol:
	mkdir -p $(HOME)/data/db
	mkdir -p $(HOME)/data/wp
	sudo chown -R $(USER) $(HOME)/data
	sudo chmod -R 777 $(HOME)/data
	
all:
	$(DC) -f $(COMPOSE_FILE) up -d --build
	
down:
	$(DC) -f $(COMPOSE_FILE) down

logs:
	$(DC) -f logs -f $(COMPOSE_FILE)
	
ps:
	$(DC) -f ps $(COMPOSE_FILE)

shell-ng:
	$(DC) -f $(COMPOSE_FILE) exec nginx sh
shell-db:
	$(DC) -f $(COMPOSE_FILE) exec mariadb sh
shell-php:
	$(DC) -f $(COMPOSE_FILE) exec  wordpress sh

clean:
	docker stop $(docker ps -qa); docker rm $(docker ps -qa); \
	docker rmi -f $(docker images -qa); \
	docker volume rm $(docker volume ls -q); \
	docker network rm $(docker network ls -q) 2>/dev/null;

.PHONY: all build down logs ps shell-ng shell-db shell-php clean


