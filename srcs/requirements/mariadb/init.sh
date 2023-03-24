#!/bin/bash

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;";

#mysql -u root -p${MYSQL_ROOT_PASSWORD} -e ";";
