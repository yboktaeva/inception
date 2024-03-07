FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt install sudo locales -y
RUN apt-get install -y nginx openssl \
    apt-get update && apt-get upgrade openssl -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=FR/ST=IDF/L=Paris/O=42Paris/OU=yuboktae/CN=yuboktae.42.fr" \
    -keyout /etc/nginx/ssl/yuboktae.42.fr.key \
    -out /etc/nginx/ssl/yuboktae.42.fr.crt

RUN chmod 600 /etc/nginx/ssl/yuboktae.42.fr.key \
    chmod 600 /etc/nginx/ssl/yuboktae.42.fr.crt && chmod 755 -R /var/www/*

COPY ./nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

ENTRYPOINT ["exec nginx -g 'daemon off;'"]