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
	@echo "\001\033[36;1m\002/> Images \001\033[0m\002"
	sudo docker images -a
	@echo

	@echo "\001\033[36;1m\002/> Networks \001\033[0m\002"
	sudo docker network ls
	@echo

	@echo "\001\033[36;1m\002/> Containers \001\033[0m\002"
	sudo docker ps -a
	@echo

	@echo "\001\033[36;1m\002/> Volumes \001\033[0m\002"
	sudo docker volume ls

.PHONY: all up stop prune fclean re reset ls

# docker inspect <container_name>
# docker network inspect <container_name>
