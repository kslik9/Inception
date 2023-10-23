FROM debian:bookworm-backports

RUN apt-get -y update && apt-get -y install mariadb-server

RUN mkdir -p /app/conf && \
	mkdir /run/mysqld && \
	chmod 777 /run/mysqld

# RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g"  /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/run.sh /app/conf/
RUN chmod 777 /app/conf/run.sh

EXPOSE 3306

ENTRYPOINT ["sh" , "/app/conf/run.sh"]

CMD ["mysqld", "--user=mysql", "--bind-address=0.0.0.0"]
