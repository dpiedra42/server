# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpiedra <dpiedra@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/11 11:07:35 by dpiedra           #+#    #+#              #
#    Updated: 2020/03/12 10:57:46 by dpiedra          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
LABEL maintainer="dpiedra@student.42.fr"

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server
RUN apt-get install -y php7.3 php7.3-mysql php7.3-fpm php7.3-common php7.3-curl php7.3 php7.3-mbstring php7.3-xml php7.3-xmlrpc php7.3-gd
