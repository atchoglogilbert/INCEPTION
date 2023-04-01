#!/bin/bash

if [ ! -d "./wordpress" ]; then
	mkdir wordpress && cd wordpress && wp --allow-root core download;
else
	cd wordpress ;
fi

# create wp config
rm -f wp-config.php;
wp --allow-root config create --dbname=${WORDPRESS_DB} --dbuser=${WORDPRESS_ADMIN} \
	--dbpass=${WORDPRESS_ADMIN_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} \
	--dbcharset=utf8 ;

mysql -h ${WORDPRESS_DB_HOST_NO_PORT} -P 3306 -u ${WORDPRESS_DB} -p${WORDPRESS_ADMIN_PASSWORD} wordpress -e "DROP DATABASE IF EXISTS ${WORDPRESS_DB};";
# mysql -h ${WORDPRESS_DB_HOST_NO_PORT} -P 3306 -u ${WORDPRESS_DB} -p${WORDPRESS_ADMIN_PASSWORD} wordpress -e "SHOW DATABASES;";

wp --allow-root db create ;

php-fpm7.4 -F