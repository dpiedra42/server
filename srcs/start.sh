# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpiedra <dpiedra@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/11 11:07:47 by dpiedra           #+#    #+#              #
#    Updated: 2020/03/11 17:21:40 by dpiedra          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#initializing
service nginx start
service mysql start

#change permissions 
chown -R www-data /var/www
chmod -R 755 /var/www

#website directory
mkdir /var/www/mysite
touch /var/www/mysite/index.php

#setup Nginx 

