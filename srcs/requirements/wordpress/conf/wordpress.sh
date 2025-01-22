#!/bin/bash

mkdir -p /var/www/html/

wget -P /var/www/html/ https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

mv /var/www/html/wp-cli.phar /usr/local/bin/wp

chmod +x /usr/local/bin/wp

cd /var/www/html/

wp core download  --allow-root

wp config create  --dbhost=$HOSTDB --dbname=$NAMEDB --dbuser=$USERDB --dbpass=$PASSWORDDB --allow-root --debug

wp core install --url=$URL --title=$TITLEWP --admin_user=$ADMINWP --admin_email=$ADMINEMAIL --admin_password=$PASSWORDWP  --allow-root --debug

wp user create $USERWP $USEREMAILWP --role=author --user_pass=$USERPASSWORDWP --allow-root --debug

wp theme install ron --activate --allow-root --debug

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

service php7.4-fpm start

service php7.4-fpm stop

php-fpm7.4 -F
