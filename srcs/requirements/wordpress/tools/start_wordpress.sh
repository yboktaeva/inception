#!/bin/sh

if [ ! -f ./wp-config.php ]; then
    wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz
    tar -xzf wordpress-6.0-fr_FR.tar.gz
    mv wordpress/* .
    rm -rf wordpress-6.0-fr_FR.tar.gz
    rm -rf wordpress
	
    cd /var/www/wordpress
    
    chown -R root:root .
    chmod 755 .

	# sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
	# sed -i "s/password_here/$DB_PASSWORD/g" wp-config-sample.php
	# sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
	# sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php

	sed -i "s/^.*DB_USER.*$/define('DB_USER', '$DB_USER');/" wp-config-sample.php
	sed -i "s/^.*DB_PASSWORD.*$/define('DB_PASSWORD', '$DB_PASSWORD');/" wp-config-sample.php
	sed -i "s/^.*DB_HOST.*$/define('DB_HOST', '$DB_HOST');/" wp-config-sample.php
    sed -i "s/^.*DB_NAME.*$/define('DB_NAME', '$DB_NAME');/" wp-config-sample.php

    cp wp-config-sample.php wp-config.php
    # wp config create --allow-root \
    #                 --dbname=$DB_NAME \
    #                 --dbuser=$DB_USER \
    #                 --dbpass=$DB_PASSWORD \
    #                 --dbhost=mariadb:3306 --path='.'

    wp core install --allow-root --path="/var/www/wordpress/"\
                    --url=$WP_DOMAIN_NAME\
                    --title=$WP_TITLE\
                    --admin_user=$WP_AUSER\
                    --admin_password=$WP_APASSWORD\
                    --admin_email=$WP_AEMAIL\
                    --skip-email
    wp user create --allow-root --path="/var/www/wordpress/"\
                    $WP_USER $WP_UEMAIL\
                    --user_pass=$WP_PASSWORD
else
	echo "wordpress already downloaded"
fi

exec "$@"

# exec /usr/sbin/php-fpm7.4 -F
