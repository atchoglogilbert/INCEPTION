FROM	debian:10.13

WORKDIR	/etc/mysql

ARG		MYSQL_ROOT_PASSWORD
ARG		WORDPRESS_ADMIN
ARG		WORDPRESS_ADMIN_PASSWORD
ARG		WORDPRESS_DB

# install debug utility
RUN		apt update -y && \
			apt install -y nano
			
# install required packages
RUN		apt update -y && \
			apt install -y mariadb-server && \
		        mysql_install_db --datadir=/var/lib/mysql;

# copy confs
COPY ./conf/50-server.cnf ./mariadb.conf.d/

# secure installation and wpdb setup
COPY	./tools/mysql_secure_installation.sh .

RUN		service mysql start && \
			bash ./mysql_secure_installation.sh && \
			rm -f ./mysql_secure_installation.sh
		
EXPOSE	3306

ENTRYPOINT [ "mysqld", "--user=mysql" ]
