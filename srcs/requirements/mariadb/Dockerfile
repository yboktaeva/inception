FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y
RUN apt install mariadb-client -y
RUN rm -rf /var/lib/apt/lists/*
COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb_script.sh /tmp/mariadb_script.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/mariadb_script.sh"]

CMD ["mariadb", "--user=mysql"]