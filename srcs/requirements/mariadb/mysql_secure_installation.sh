#!/bin/bash

# set root passoword
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';";

# setup wordpress
## create default wpdb if not exists
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;";

## create wpdb user and 
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON ${WORDPRESS_DB}.* TO \
	'${WORDPRESS_ADMIN}'@'%' IDENTIFIED BY '${WORDPRESS_ADMIN_PASSWORD}'; \
	FLUSH PRIVILEGES;";
