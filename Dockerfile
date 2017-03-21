FROM php:7.1-apache
RUN docker-php-ext-install -j$(nproc) mysqli
COPY php.ini /usr/local/etc/php/
COPY src /var/www/html
RUN chown -R www-data: /var/www/html
