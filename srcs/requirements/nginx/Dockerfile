FROM	debian:10.13

RUN		apt update -y
RUN		apt install -y nginx

ADD		conf/nginx.conf /etc/nginx/nginx.conf
ADD		conf/cert.crt /etc/ssl/cert.crt
ADD		conf/key.key /etc/ssl/key.key

EXPOSE	80
EXPOSE	443

CMD 	["nginx", "-g", "daemon off;"]
