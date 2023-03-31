all: up ls

up:
	docker compose -f ./srcs/docker-compose.yml up -d;

stop:
	docker stop $(shell docker ps -a -q);

prune:
	docker system prune --volumes -af
	docker volume prune -f --filter all=true 

fclean:
	docker rmi -f $(shell docker images -aq);

re: stop fclean all

reset: stop prune all

ls:
	@echo "\001\033[36;1m\002/> Images \001\033[0m\002"
	docker images -a
	@echo

	@echo "\001\033[36;1m\002/> Networks \001\033[0m\002"
	docker network ls
	@echo

	@echo "\001\033[36;1m\002/> Containers \001\033[0m\002"
	docker ps -a
	@echo

	@echo "\001\033[36;1m\002/> Volumes \001\033[0m\002"
	docker volume ls

.PHONY: all up stop prune fclean re reset ls

# docker inspect <container_name>
# docker network inspect <container_name>
