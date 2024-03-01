
FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install sudo locales -y
RUN apt intsall curl -y
RUN apt install vim -y
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/yuboktae.42.fr.key \
    -out /etc/nginx/ssl/yuboktae.42.fr.crt \
    -subj "/C=FR/ST=IDF/L=Paris/O=42Paris/OU=yuboktae/CN=yuboktae.42.fr"

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]