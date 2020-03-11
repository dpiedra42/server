# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpiedra <dpiedra@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/11 11:07:47 by dpiedra           #+#    #+#              #
#    Updated: 2020/03/11 15:06:46 by dpiedra          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service nginx start
service mysql start

#configure access
chown -R www-data /var/www
chmod -R 755 /var/www