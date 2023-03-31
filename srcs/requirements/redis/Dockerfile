FROM debian:10.13

WORKDIR .

# install utils
RUN	apt update -y && \
		apt install -y unzip curl php-redis net-tools

# install redis-server
RUN	apt update -y && \
		apt install -y redis

# download redis plugin
RUN curl -o ./redis-cache.zip https://downloads.wordpress.org/plugin/redis-cache.2.2.4.zip && \
	unzip redis-cache.zip && \
	rm -rf redis-cache.zip

RUN		rm -rf /var/lib/apt/lists/*

COPY  redis.conf /etc/redis
COPY  redis_launch.sh .

EXPOSE 6379

ENTRYPOINT ["bash", "redis_launch.sh"]
