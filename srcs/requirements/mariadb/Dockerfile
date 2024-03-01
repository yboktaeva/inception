FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server -y
RUN apt install mariadb-client -y

COPY ./mariadb-setup.sh /tmp/mariadb-setup.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/mariadb-setup.sh"]

CMD ["mariadb", "--user=mysql"]