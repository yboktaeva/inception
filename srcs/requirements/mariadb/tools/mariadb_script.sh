#!/bin/sh

if [ ! -d "/var/lib/mysql/wp_db" ]; then
    service mysql start
    mkdir -p /run/mysqld /var/lib/mysql
    chown -R mysql:mysql /var/lib/mysql /run/mysqld
    chmod 777 /var/run/mysqld

    mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

    mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

    mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

    # mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

    mysql -e "FLUSH PRIVILEGES;"

    mysqladmin -u root password $DB_ROOT_PASSWORD

    service mysql stop
fi

exec /usr/bin/mysqld_safe