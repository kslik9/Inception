#!/bin/bash



cd /var/www/html/wordpress
# rm -rf /var/www/html/wordpress/*

if ! wp --allow-root core is-installed; then
    wp --allow-root core download
    wp --allow-root config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=mariadb:3306
    wp --allow-root core install --url=${LINK} --title=${TITLE} --admin_name=${ADMIN_NAME} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL}
    chmod -R 755 /var/www/html/
fi

wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q ${WORDPRESS_USER}
if [ $? != 0 ]; then
	wp user create --allow-root ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} --role=editor --user_pass=${WORDPRESS_USER_PASS} --path=/var/www/html/wordpress;
fi
chown -R www-data:www-data /var/www/html/
    chmod -R 777 /var/www/html/
exec "$@"