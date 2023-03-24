FROM	debian:10.13

RUN		apt update -y update && \
		apt install -u curl gnupg2 && \
		curl https://wordpress.org/latest.tar.gz | tar -xvf && \
		rm -rf /var/www/html && \
		mv wordpress /var/www/hmtl
		# chown -R www-data:www-data /var/www/html && \
		# rm -rf /var/lib/apt/lists/*
		
COPY	wp-config.php var/www/html

EXPOSE	9000

CMD 	["nginx"]
