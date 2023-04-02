FROM debian:10.13

WORKDIR /var/www/html/

# install PHP installation dependencies
RUN apt update && \
    apt install -y \
    curl \
    gnupg \
    ca-certificates \
    libpng-dev \
    libjpeg-dev \
    libzip-dev \
    unzip

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
    php7.4-zip

RUN	mkdir /run/php && touch /run/php/php7.4-fpm.pid && \
	mkdir /var/log/php-fpm/ && touch /var/log/php-fpm/access.log && \
	chown www-data:www-data /var/log/php-fpm/access.log

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# install MariaDB client
RUN apt update && \
    apt install -y mariadb-client

COPY ./conf/50-client.cnf /etc/mysql/mariadb.conf.d/

# download and install wordpress cli
RUN apt update && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	mv wp-cli.phar /bin/wp && \
	chmod +x /bin/wp

# install debug utility
RUN	apt update -y && \
		apt install -y nano

RUN	 rm -rf /var/lib/apt/lists/*	

COPY ./tools/run.sh .

EXPOSE 9000

# Start PHP-FPM
ENTRYPOINT [ "bash", "./run.sh" ]
