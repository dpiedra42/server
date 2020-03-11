FROM debian:buster
LABEL maintainer="dpiedra@student.42.fr"

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y nginx
RUN apt-get install mariadb
RUN apt-get install 