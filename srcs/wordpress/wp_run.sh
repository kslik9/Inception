#!/bin/bash

cd /var/www/html/
mkdir wordpress
cd /var/www/html/wordpress
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz -C /var/www/html
sudo chmod +x /usr/local/bin/wp


wp --allow-root core config --dbhost=localhost --dbname=ksalka --dbuser=kslik --dbpass=khalid2002

chmod 777 wp-config.php

wp --allow-root core install --url=localhost --title="lmalik" --admin_name=kslik --admin_password=khalid2002 --admin_email=khalidaslik00@gmail.com
