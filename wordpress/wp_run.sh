#!/bin/bash

# mkdir -p /var/www/html/wordpress


cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*
# wget https://wordpress.org/latest.tar.gz
# tar -xzvf latest.tar.gz -C /var/www/html
chmod +x /usr/local/bin/wp

wp --allow-root core download
wp --allow-root config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=mariadb_container:3306


wp --allow-root core install --url=localhost --title="lmalik" --admin_name=kslik --admin_password=khalid2002 --admin_email=khalidaslik00@gmail.com
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
exec "$@"