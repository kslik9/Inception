#!/bin/bash

mkdir -p /run/mysqld

cat << EOF > /tmp/mdb.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ksalka;
CREATE USER IF NOT EXISTS 'kslik'@'localhost' IDENTIFIED BY 'Khalid2002';
GRANT ALL PRIVILEGES ON ksalka.* TO 'kslik'@'%' IDENTIFIED BY 'Khalid2002';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'khalid';
EOF

mariadbd --user=root --bootstrap < /tmp/mdb.sql;

exec "$@"