FROM php:8.2.4-fpm-alpine
 
WORKDIR /var/www/html
 
COPY . .
 
RUN docker-php-ext-install pdo pdo_mysql

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

# COPY --from=composer:2.5.1 /usr/bin/composer /usr/local/bin/composer

# RUN composer install --quiet --optimize-autoloader --no-dev

USER laravel


# ARG PHP_EXTENSIONS="intl pdo_mysql pdo_pgsql bcmath"

# FROM thecodingmachine/php:7.4-v3-slim-apache as php_base
# LABEL maintainer "Julius Krah <juliuskrah@gmail.com>"

# ENV TEMPLATE_PHP_INI=production
# COPY --chown=docker:docker . /var/www/html
# RUN composer install --quiet --optimize-autoloader --no-dev

# FROM node:10 as node_dependencies
# WORKDIR /var/www/html

# ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=false
# COPY --from=php_base /var/www/html /var/www/html

# RUN npm set progress=false && \
#   npm config set depth 0 && \
#   npm install && \
#   npm run prod && \
#   rm -rf node_modules

# FROM php_base
# ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
# COPY --from=node_dependencies --chown=docker:docker /var/www/html /var/www/html