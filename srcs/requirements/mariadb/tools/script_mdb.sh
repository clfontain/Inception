#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
	
	touch /var/lib/mysql/mysql.sock
	chown -R mysql:mysql /var/lib/mysql
fi

#echo " LES VARIABLES ${MDB_USER} ${MDB_PASSWORD} ${MDB_DATABASE} ${MDB_ROOT_PASSWORD}" > /var/lib/mysql/log_mysql.txt

service mysql start;

mysql -u root -e "FLUSH PRIVILEGES;"

mysql -u root -e "CREATE DATABASE ${MDB_DATABASE};"

mysql -u root -e "CREATE USER '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASSWORD}';"

mysql -u root -e "GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO '${MDB_USER}'@'%';"

mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';"

mysqladmin -u root -p${MDB_ROOT_PASSWORD} shutdown

exec mysqld_safe 
