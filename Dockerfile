FROM php:7-fpm
RUN docker-php-ext-install mysqli pdo pdo_mysql

ADD https://pecl.php.net/get/apcu-5.1.8.tgz /tmp/apcu.tar.gz
RUN mkdir -p /usr/src/php/ext/apcu\
  && tar xf /tmp/apcu.tar.gz -C /usr/src/php/ext/apcu --strip-components=1

RUN docker-php-ext-configure apcu\
  && docker-php-ext-install apcu

RUN pecl install xdebug\
  && docker-php-ext-enable xdebug

RUN rm -rd /usr/src/php/ext/apcu && rm /tmp/apcu.tar.gz
