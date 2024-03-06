#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]; then
    service mysql start
    mkdir -p /run/mysqld /var/lib/mysql
    chown -R mysql:mysql /var/lib/mysql /run/mysqld
    chmod 777 /var/run/mysqld
    # mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

    mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

    mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

    mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

    # mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

    mysql -e "FLUSH PRIVILEGES;"

    mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

    service mysql stop

fi

/usr/bin/mysqld_safe