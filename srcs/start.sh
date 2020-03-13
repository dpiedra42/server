#initializing
service nginx start
service mysql start

#change permissions 
chown -R www-data /var/www
chmod -R 755 /var/www

#website directory
mkdir /var/www/mysite
touch /var/www/mysite/index.php
# figure out how to put <?php phpinfo(); ?> into index

#setup Nginx 

