FROM php:8.2-apache

WORKDIR /var/www/html

RUN docker-php-ext-install pdo_mysql

COPY . .

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80


