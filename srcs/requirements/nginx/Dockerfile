FROM	debian:10.13

WORKDIR /etc/nginx/

# install utility
RUN		apt update -y && \
			apt install -y nano && \
			rm -rf /var/lib/apt/lists/*

# install packages
RUN		apt update -y && \
			apt install -y nginx && \
			rm -rf /var/lib/apt/lists/*

COPY		nginx.conf .
COPY		cert.crt /etc/ssl/
COPY		key.key /etc/ssl/

RUN		echo 'fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;' >> /etc/nginx/fastcgi_params

EXPOSE	443

CMD 	["nginx", "-g", "daemon off;"]
