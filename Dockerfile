FROM php:8.2-fpm-alpine AS builder
WORKDIR /app
COPY . .
RUN docker-php-ext-install pdo_mysql

FROM php:8.2-fpm-alpine
WORKDIR /var/www/html
COPY --from=builder /app /var/www/html
RUN chown -R www-data:www-data /var/www/html
EXPOSE 9000
CMD ["php-fpm"]

