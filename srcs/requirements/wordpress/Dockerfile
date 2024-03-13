FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y vim wget php7.4 php-fpm php-cgi php-mysql php-cli mariadb-client && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /run/php/ /var/www/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
#     cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && \
#     chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools/start_wordpress.sh /tmp/start_wordpress.sh

RUN chmod +x /tmp/start_wordpress.sh

EXPOSE 9000

ENTRYPOINT ["/tmp/start_wordpress.sh"]
