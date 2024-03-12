#!/bin/sh

if [ ! -f ./wp-config.php ]; then
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	
    cp wp-config-sample.php wp-config.php
    
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

exec /usr/sbin/php-fpm7.4 -F
