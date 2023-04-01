#!/bin/bash

if [ ! -d wordpress ]; then
	
	# downlooad wordpress files
	mkdir wordpress && cd wordpress && wp --allow-root core download;

	# create wp config
	wp --allow-root config create --dbname=${WORDPRESS_DB} --dbuser=${WORDPRESS_ADMIN} \
		--dbpass=${WORDPRESS_ADMIN_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} \
		--dbcharset=utf8 ;

	# create db
	mysql -h ${WORDPRESS_DB_HOST_NO_PORT} -P 3306 -u ${WORDPRESS_DB} \
		-p${WORDPRESS_ADMIN_PASSWORD} wordpress -e "DROP DATABASE IF EXISTS ${WORDPRESS_DB};";
	wp --allow-root db create ;

	# install wordpress
	wp --allow-root core install --url=${WEBSITE_URL} --title=${WEBSITE_TITLE} --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WEBSITE_ADMIN_EMAIL} ;
fi

php-fpm7.4 -F
