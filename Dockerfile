FROM php:8.2-fpm-alpine3.21 AS builder
WORKDIR /app
COPY . .
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && docker-php-ext-install pdo_mysql \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

FROM php:8.2-fpm-alpine3.21
WORKDIR /var/www/html
COPY --from=builder /app /var/www/html
RUN chown -R www-data:www-data /var/www/html
EXPOSE 9000
CMD ["php-fpm"]

