#!/bin/bash

service mariadb start


mariadb -e "CREATE DATABASE IF NOT EXISTS $NAMEDB;"

mariadb -e "CREATE USER IF NOT EXISTS '$USERDB'@'%' IDENTIFIED BY '$PASSWORDDB';"

mariadb -e "GRANT ALL PRIVILEGES ON $NAMEDB.* TO '$USERDB'@'%';"

mariadb -e "FLUSH PRIVILEGES;"

sleep 10

service mariadb stop

mysqld_safe