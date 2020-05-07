#initializing
service mysql start

#website directory
mkdir -p /var/www/mysite
touch /var/www/mysite/info.php
echo "<?php phpinfo(); ?>" >> /var/www/mysite/info.php

#change permissions 
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#SSL (self-signed)
mkdir -p /etc/nginx/ssl
openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/mysite.pem -keyout /etc/nginx/ssl/mysite.key -subj "/C=FR/ST=Paris/L=Paris/O=Ecole 42/OU=dpiedra/CN=www.mysite.com"

#setup Nginx 
service nginx start
mv /tmp/nginx-conf.conf /etc/nginx/sites-available/mysite
ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite

#setup mysql
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'dpiedra'@'localhost' IDENTIFIED BY 'root';" | mysql -u root
echo "GRANT USAGE ON *.* TO 'dpiedra'@'localhost' IDENTIFIED BY 'root';" | mysql -u root
echo "GRANT ALL privileges ON *.* TO 'dpiedra'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#PHPmyadmin
service php7.3-fpm start
mkdir /var/www/mysite/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/mysite/phpmyadmin
mv ./tmp/phpmyadmin.config.php /var/www/mysite/phpmyadmin/config.inc.php

#Wordpress
mkdir -p /var/www/mysite/wordpress
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz --strip-components 1 -C /var/www/mysite/wordpress
mv /tmp/wp-config.php /var/www/mysite/wordpress

#update changes
service nginx restart
service mysql restart
service php7.3-fpm restart

