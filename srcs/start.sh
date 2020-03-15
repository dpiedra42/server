#initializing
service mysql start

#website directory
mkdir -p /var/www/mysite

#change permissions 
chown -R www-data /var/www
chmod -R 755 /var/www

#SSL (self-signed)
mkdir -p /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/mysite.pem -keyout /etc/nginx/ssl/mysite.key -subj openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/monsupersite.pem -keyout /etc/nginx/ssl/monsupersite.key -subj "/C=FR/ST=Paris/L=Paris/O=Ecole 42/OU=dpiedra/CN=www.mysite.com"

#setup Nginx 
service nginx start
mv /tmp/nginx-conf.conf /etc/nginx/sites-available/mysite
ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite

#update changes
service nginx restart