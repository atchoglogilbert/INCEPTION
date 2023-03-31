FROM	debian:10.13

WORKDIR /etc/nginx/

# install packages
RUN		apt update -y && \
			apt install -y nginx openssl

# generate ssl private key and cert
RUN		openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/key.key -x509 -days 365 -out /etc/ssl/cert.crt -subj \
		"/C=DE/ST=NorthRhine-Westphalia/L=Heilbronn/O=42Heilbronn/OU=StudentBody/CN=katchogl.42.fr/emailAddress=katchogl@student.42heilbronn.de"

COPY	nginx.conf .

# install utility
RUN		apt update -y && \
			apt install -y nano

RUN		rm -rf /var/lib/apt/lists/*	

EXPOSE	443

CMD 	["nginx", "-g", "daemon off;"]
