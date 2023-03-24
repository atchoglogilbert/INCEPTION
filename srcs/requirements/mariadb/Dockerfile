FROM	debian:10.13

WORKDIR	/etc/mysql

RUN		apt update -y && \
			apt install -y mariadb-server

ARG		MYSQL_ROOT_PASSWORD

COPY	init.sh .

RUN		service mysql start && bash ./init.sh

EXPOSE	3306

ENTRYPOINT	["mysqld_safe", "-user=mysql"]
