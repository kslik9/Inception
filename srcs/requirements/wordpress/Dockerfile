FROM debian:bookworm

RUN apt-get update && apt-get install -y wget tar && apt install -y php-fpm wget mariadb-client \
    && apt-get install -y php-mysql \
    && sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./wp_run.sh /


RUN mkdir -p /run/php/

WORKDIR /var/www/html/wordpress
EXPOSE 9000

ENTRYPOINT ["/wp_run.sh"]

CMD [ "php-fpm8.2", "-F" ]