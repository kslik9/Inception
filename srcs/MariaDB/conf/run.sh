#!/bin/bash

mkdir -p /run/mysqld
PASSWORD='khalid2002'

# mariadb -u root -p$PASSWORD < MDB.sql

mariadbd --user=root --bootstrap < MDB.sql

exec "$@"