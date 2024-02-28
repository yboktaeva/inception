
FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install sudo locales -y
RUN apt update -y
RUN apt install nginx -y
RUN apt install vim -y
RUN apt intsall curl -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y

# COPY

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]