FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y nginx openssl


RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=fes/L=lmasira/O=1337/OU=sol/CN=ksalka"



COPY ./conf/ssl.conf /etc/nginx/conf.d/ssl.conf

EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]