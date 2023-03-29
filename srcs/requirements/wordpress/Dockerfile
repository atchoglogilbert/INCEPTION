FROM debian:10.13

WORKDIR /var/www/html

ARG		WORDPRESS_ADMIN
ARG		WORDPRESS_ADMIN_PASSWORD
ARG		WORDPRESS_DB
ARG		WORDPRESS_DB_HOST

# install required packages
RUN apt update && \
    apt install -y \
    curl \
    gnupg \
    ca-certificates \
    libpng-dev \
    libjpeg-dev \
    libzip-dev \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# install PHP
RUN curl -fsSL https://packages.sury.org/php/apt.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list && \
    apt update && \
    apt install -y \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-xml \
    php7.4-mbstring \
    php7.4-zip \
    && rm -rf /var/lib/apt/lists/*

# download and extract WordPress
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -zxvf latest.tar.gz && \
    rm latest.tar.gz && \
	chown -R www-data:www-data /var/www/html/wordpress

# copy custom configs
WORKDIR /var/www/html/wordpress
COPY www.conf /etc/php/7.4/fpm/pool.d/
COPY php.ini /etc/php/7.4/fpm/

# rm sample
RUN  rm -f wp-config-sample.php

# RUN		mkdir /run/php && touch /run/php/php7.4-fpm.sock
RUN		mkdir /run/php && touch /run/php/php7.4-fpm.pid && \
		mkdir /var/log/php-fpm/ && touch /var/log/php-fpm/access.log && \
		chown www-data:www-data /var/log/php-fpm/access.log

# install utility
RUN		apt update -y && \
			apt install -y nano net-tools && \
			rm -rf /var/lib/apt/lists/*

COPY 	wp_init.sh .

RUN		bash ./wp_init.sh && \
		rm -f ./wp_init.sh

EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.4", "-F"]
