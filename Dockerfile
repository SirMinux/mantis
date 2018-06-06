FROM php:5-apache

RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install -j$(nproc) iconv mbstring
RUN docker-php-ext-install -j$(nproc) iconv mysqli

EXPOSE 80

VOLUME /var/www/html/

WORKDIR /var/www/html/

COPY ./ ./