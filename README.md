# Inception

- [ ] MariaDB setup
- [ ] users
- [ ] WordPress setup

- [ ] volumes
- [ ] domain name
- [ ] network

Introduction:
// broaden knowledge of system administration 
// virtualize several docker images INSIDE VIRTUAL MACHINE
// All files except Makefile must be in srcs, which must use docker-compose.yml to set up entire app

Mandatory part:


MySQL: Bugs:

> ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
service has not started

> mariadb container exiting after some time:
mysqld exits after some time, and docker reruns, and my sql command was rerun without -p, mysqld asks for password, docker cancels input, container exits