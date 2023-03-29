# Inception

## TODO:

1. improve mysql_secure_installation.sh

## Notes
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

ss -tlnp | grep 9000       


CMD ["bash", "tmp.sh"]

CMD ["php-fpm7.4", "-F"]

php-fpm7.4 -F

mysqli_real_connect( $this->dbh, $host, $this->dbuser, $this->dbpassword, null, $port, $socket, $client_flags );