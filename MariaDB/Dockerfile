FROM debian:bookworm-backports

RUN apt-get update && apt install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/conf

RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g"  /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/run.sh /app/conf/
RUN chmod +x  /app/conf/run.sh

# WORKDIR /app/conf/

EXPOSE 3306

ENTRYPOINT ["/app/conf/run.sh"]

CMD ["mariadbd", "--user=root"]