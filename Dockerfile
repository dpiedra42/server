FROM debian:buster
LABEL maintainer="dpiedra@student.42.fr"

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server
RUN apt-get install -y php7.3 php7.3-mysql php7.3-fpm php7.3-common php7.3-curl php7.3 php7.3-mbstring php7.3-xml php7.3-xmlrpc php7.3-gd

COPY /srcs/start.sh/ ./
COPY /srcs/nginx.conf ./tmp/nginx.conf