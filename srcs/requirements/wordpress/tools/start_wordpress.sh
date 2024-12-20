#!/bin/sh
if [ ! -f "/var/www/wordpess/wp-config.php" ]; then
    wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www
    cd /var/www/
    tar -xzf wordpress-6.4-fr_FR.tar.gz
    rm -rf wordpress-6.4-fr_FR.tar.gz
    chown -R www-data:www-data .
    chmod -R 755 .
    wp config create --allow-root --path="/var/www/wordpress" \
                    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_PASSWORD \
                    --dbprefix=wp_ \
                    --dbhost=mariadb --path="/var/www/wordpress" \
                    --force
    echo "define('FS_METHOD','direct');" >> /var/www/wordpress/wp-config.php
    wp core is-installed --allow-root --path="/var/www/wordpress" || wp core install --allow-root --path="/var/www/wordpress" \
                    --url=$WP_DOMAIN_NAME \
                    --title=$WP_TITLE \
                    --admin_user=$WP_AUSER \
                    --admin_password=$WP_APASSWORD \
                    --admin_email=$WP_AEMAIL \
                    --skip-email
    if ! wp user get $WP_USER --path="/var/www/wordpress" > /dev/null 2>&1; then
        wp user create --allow-root --path="/var/www/wordpress" \
                    $WP_USER $WP_UEMAIL \
                    --user_pass=$WP_PASSWORD
    else
        echo "User '$WP_USER' already exists."
    fi
else
	echo "wordpress already downloaded"
fi

exec /usr/sbin/php-fpm7.4 -F