FROM php:8.1-alpine

RUN set -ex \
    && apk update \
    && apk add --no-cache git curl openssh-client icu libpng freetype libjpeg-turbo postgresql-dev libffi-dev libsodium libzip-dev ffmpeg \
    && apk add --no-cache --virtual build-dependencies icu-dev libxml2-dev freetype-dev libpng-dev libjpeg-turbo-dev g++ make autoconf libsodium-dev postgresql-client \
    && docker-php-source extract \
    && pecl install swoole redis sodium \
    && docker-php-ext-enable redis swoole sodium \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) pgsql pdo_pgsql intl zip gd exif pcntl bcmath \
    && docker-php-source delete \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && cd  / && rm -fr /src \
    && apk del build-dependencies \
    && rm -rf /tmp/*

WORKDIR /app

COPY . .

RUN mkdir -p \
    storage/framework/{sessions,views,cache} \
    storage/logs \
    bootstrap/cache \
    storage \
    bootstrap/cache \
    && chmod -R ug+rwx storage bootstrap/cache

RUN composer install --no-dev --no-interaction --prefer-dist --ignore-platform-reqs --optimize-autoloader --apcu-autoloader --ansi --no-scripts --audit

RUN php artisan optimize:clear

RUN php artisan optimize

EXPOSE 80

CMD [ "php", "artisan", "octane:start", "--server=swoole", "--max-requests=500", "--host=0.0.0.0", "--port=80" ]
