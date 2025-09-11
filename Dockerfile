FROM composer:2 as builder
WORKDIR /app

COPY composer.json composer.lock ./
RUN composer install --no-dev --optimize-autoloader --no-interaction

COPY . .

FROM php:8.2-fpm-alpine
WORKDIR /var/www/html

COPY --from=builder /app/vendor /var/www/html/vendor
COPY --from=builder /app/public /var/www/html/public
COPY --from=builder /app/src /var/www/html/src
COPY --from=builder /app/index.php /var/www/html/index.php

RUN docker-php-ext-install pdo_mysql \
    && chown -R www-data:www-data /var/www/html

EXPOSE 9000
CMD ["php-fpm"]

