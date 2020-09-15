# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: deannapiedra <deannapiedra@student.42.f    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/13 13:56:32 by deannapiedr       #+#    #+#              #
#    Updated: 2020/09/15 10:33:22 by deannapiedr      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y procps && apt-get install nano && apt-get install -y wget
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server

COPY ./srcs/start.sh/ ./
COPY ./srcs/nginx-conf.conf ./tmp/nginx-conf.conf
COPY ./srcs/phpmyadmin.config.php ./tmp/phpmyadmin.config.php
COPY ./srcs/wp-config.php ./tmp/wp-config.php

EXPOSE 80 443
CMD bash start.sh
#docker build -t server .
#docker run -it -p 80:80 -p 443:443 server