#initializing
service nginx start
service mysql start

#website directory
mkdir /var/www/mysite

#change permissions 
chown -R www-data /var/www
chmod -R 755 /var/www

#SSL (self-signed)
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/mysite.pem -keyout /etc/nginx/ssl/mysite.key -subj openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/monsupersite.pem -keyout /etc/nginx/ssl/monsupersite.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=dpiedra/CN=mysite"

#setup Nginx 
mv ./tmp/nginx.conf etc/nginx/sites-available/mysite
cp etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite

#update changes
service nginx restart