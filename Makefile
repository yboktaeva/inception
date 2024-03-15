# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yuboktae <yuboktae@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/24 13:05:01 by yuboktae          #+#    #+#              #
#    Updated: 2024/03/15 19:56:31 by yuboktae         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE = ./srcs/docker-compose.yml
DC = docker compose

all: build up
build:
	$(DC) -f $(COMPOSE_FILE) build
up: create-vol
	$(DC) -f $(COMPOSE_FILE) up -d
create-vol:
	@mkdir -p /home/$(USER)/data/db
	@mkdir -p /home/$(USER)/data/wp
clean-vol:
	@sudo chown -R $(USER):$(USER) /home/$(USER)/data
	@rm -rf /home/$(USER)/data
down:
	$(DC) -f $(COMPOSE_FILE) down

clean:
	@chmod +x ./srcs/requirements/tools/clean.sh
	@./srcs/requirements/tools/clean.sh

prune:
	@docker system prune --all --force --volumes

.PHONY: all build down clean create-vol clean-vol