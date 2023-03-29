#!/bin/bash

# secure installation

## set root password
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';";
## remove anonymous users
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE NOT User='root';";
## disallow root remote login
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');";
## remove test database
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DROP DATABASE IF EXISTS test;";

# setup wordpress
## create default wpdb if not exists
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;";
## create wpdb user and 
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON ${WORDPRESS_DB}.* TO \
	'${WORDPRESS_ADMIN}'@'%' IDENTIFIED BY '${WORDPRESS_ADMIN_PASSWORD}';";

# reload privileges table
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;";



