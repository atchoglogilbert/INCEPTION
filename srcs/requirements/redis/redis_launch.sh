#!/bin/bash

if ! grep -q WP_REDIS_HOST /var/www/html/wordpress/wp-config.php;
then
	# install redis on wp
	mv -f redis-cache /var/www/html/wordpress/wp-content/plugins/redis-cache;

	# add password
	echo "requirepass $WP_REDIS_PASSWORD" >> /etc/redis/redis.conf;

	# configure wp
	echo "
		define( 'WP_CACHE_KEY_SALT', 			',uSq5p(u#KpJ9Mp@w0Vr<pyJ0cUZQmWO0rm:e%]_%}Zv!OixiObH%\`r=FDiXLO.Z' );
		define( 'WP_REDIS_DEBUG', true ) ;
		define( 'WP_REDIS_TRACE', true ) ;
		define( 'WP_REDIS_HOST', 			'redis' );
		define( 'WP_REDIS_PORT', 			'6379' );
		define( 'WP_REDIS_PASSWORD', 			'$WP_REDIS_PASSWORD' );
		define( 'WP_REDIS_DATABASE', 			'0' );" >> /var/www/html/wordpress/wp-config.php;
fi

redis-server;
