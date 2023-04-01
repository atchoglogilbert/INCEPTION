#/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
        mysql_install_db --datadir=/var/lib/mysql;
fi

mysqld --user=mysql;
