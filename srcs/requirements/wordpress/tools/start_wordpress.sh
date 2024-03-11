#!/bin/sh
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*
if [ ! -f /var/www/wordpress/wp-config.php ]; then
wp core download --allow-root --path="/var//www/wordpress/"
wp config create --allow-root --path="/var//www/wordpress/"\
                --dbname=$DB_NAME\
                --dbuser=$DB_USER\
                --dbpass=$DB_PASS\
                --dbhost=$DB_HOST\
                --dbprefix=wp_
wp core install --allow-root --path="/var//www/wordpress/"\
                --url=$WP_DOMAIN_NAME\
                --title=$WP_TITLE\
                --admin_user=$WP_AUSER\
                --admin_password=$WP_APASSWORD\
                --admin_email=$WP_AEMAIL\
                --skip-email
wp user create --allow-root --path="/var//www/wordpress/"\
                $WP_USER $WP_UEMAIL\
                --user_pass=$WP_PASSWORD
fi
exec /usr/sbin/php-fpm7.4 -F