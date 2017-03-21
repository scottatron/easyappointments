FROM php:7.1-apache
RUN docker-php-ext-install -j$(nproc) mysqli
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
RUN apt-get install -y git
RUN apt-get install -y unzip
RUN docker-php-ext-install -j$(nproc) zip
RUN docker-php-ext-install -j$(nproc) posix
COPY php.ini /usr/local/etc/php/
COPY src /var/www/html
RUN chown -R www-data: /var/www/html/storage
