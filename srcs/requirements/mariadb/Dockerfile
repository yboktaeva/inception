FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade
RUN apt-get install -y mariadb-server mariadb-client && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/my.cnf /etc/my.cnf.d/my.cnf
COPY ./tools/mariadb_script.sh /tmp/mariadb_script.sh
RUN chmod +x /tmp/mariadb_script.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/mariadb_script.sh"]

CMD ["mariadb", "--user=mysql"]