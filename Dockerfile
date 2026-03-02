FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    git unzip libzip-dev libpng-dev libicu-dev libxml2-dev \
    && docker-php-ext-install mysqli zip gd intl soap opcache

RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . .

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
