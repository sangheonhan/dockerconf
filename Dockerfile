FROM php:7.2-fpm
RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath

ADD https://pecl.php.net/get/apcu-5.1.8.tgz /tmp/apcu.tar.gz
RUN mkdir -p /usr/src/php/ext/apcu\
  && tar xf /tmp/apcu.tar.gz -C /usr/src/php/ext/apcu --strip-components=1

RUN docker-php-ext-configure apcu\
  && docker-php-ext-install apcu

RUN pecl install -o -f redis \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable redis

RUN pecl install xdebug\
  && docker-php-ext-enable xdebug

RUN apt-get update && apt-get install -y libmcrypt-dev \
  && echo | pecl install -o -f mcrypt-snapshot \
  && echo extension=mcrypt.so > /usr/local/etc/php/conf.d/docker-php-ext-mcrypt.ini

RUN rm -rd /usr/src/php/ext/apcu && rm /tmp/apcu.tar.gz
