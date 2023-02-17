# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cfontain <cfontain@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/16 12:23:08 by cfontain          #+#    #+#              #
#    Updated: 2023/02/16 12:23:20 by cfontain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


wordpress = /home/cfontain/data/wordpress
mariadb = /home/cfontain/data/mariadb

all:	| $(wordpress) $(mariadb) 
	@docker compose -f srcs/docker-compose.yml up -d --build

$(wordpress):
	@echo "Making $(wordpress) directory..."
	@sudo mkdir -p $@
	@sudo chmod 777 $@

$(mariadb):
	@echo "Making $(mariadb) directory..."
	@sudo mkdir -p $@
	@sudo chmod 777 $@

re: fclean all

run:
	@docker compose -f srcs/docker-compose.yml up -d

stop:
	@docker compose -f srcs/docker-compose.yml down

clean:  stop
	@docker compose -f srcs/docker-compose.yml down -v
	
fclean: clean 
	@sudo rm -rf /home/cfontain/data/wordpress
	@sudo rm -rf /home/cfontain/data/mariadb
	@docker system prune -a -f
.PHONY: stop clean fclean run all  re

