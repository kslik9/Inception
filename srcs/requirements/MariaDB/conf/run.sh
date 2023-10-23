#!/bin/bash


if [ ! -d "/run/mysqld" ]; then
	mkdir /run/mysqld
	chmod 777 /run/mysqld
fi

cat << EOF > /tmp/mdb.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${TABLE};
CREATE USER IF NOT EXISTS '${USER}'@'localhost' IDENTIFIED BY '${USER_PASS}';
GRANT ALL PRIVILEGES ON ${TABLE}.* TO '${USER}'@'%' IDENTIFIED BY '${TABLE_PASS}';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${USER_TWO}';
EOF

mariadbd --user=mysql --bootstrap < /tmp/mdb.sql;

exec "$@"