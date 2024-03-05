FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install php7.3 -y \
    php-fpm\
    php-mysql\
    mariadb-client
