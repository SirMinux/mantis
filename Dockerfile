FROM php:5.6.36-apache

RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install -j$(nproc) iconv mbstring
RUN docker-php-ext-install -j$(nproc) iconv mysqli

EXPOSE 80

VOLUME /var/www/html/

WORKDIR /var/www/html/

COPY ./ ./

RUN chown -R www-data:www-data /var/www
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf