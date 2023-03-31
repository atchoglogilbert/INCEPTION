FROM debian:10.13

WORKDIR .

RUN	apt update -y && \
		apt install -y adminer

RUN a2enconf adminer.conf

ENTRYPOINT []