all: up ls

up:
	sudo docker compose -f ./srcs/docker-compose.yml up -d;

stop:
	sudo docker stop $(shell sudo docker ps -a -q);

prune:
	sudo docker system prune --volumes -af
	sudo docker volume prune -f --filter all=true 

fclean:
	sudo docker rmi -f $(shell sudo docker images -aq);

re: stop fclean all

reset: stop prune all

ls:
	sudo docker images -a
	@echo " "
	sudo docker ps -a
	@echo " "
	sudo docker volume ls

.PHONY: all up stop fclean re ls
