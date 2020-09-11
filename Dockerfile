FROM debian:buster
LABEL maintainer="dpiedra@student.42.fr"

RUN apt-get update && apt-get install -y procps && apt-get install nano && apt-get install -y wget
RUN apt-get install -y nginx
RUN apt-get install -y wget
RUN apt-get install -y mariadb-server
RUN apt-get install -y php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap

COPY ./srcs/start.sh/ ./
COPY ./srcs/nginx-conf.conf ./tmp/nginx-conf.conf
COPY ./srcs/phpmyadmin.config.php ./tmp/phpmyadmin.config.php
COPY ./srcs/wp-config.php ./tmp/wp-config.php

CMD bash start.sh