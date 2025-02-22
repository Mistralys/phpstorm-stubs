FROM php:8.1.0alpha2-alpine
RUN echo 'memory_limit = 512M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN set -eux; \
    apk add --no-cache --virtual .build-deps \
    bash gcc g++ make autoconf pkgconfig git \
    libmcrypt-dev imap-dev php8-imap enchant2 php8-enchant bzip2-dev gettext-dev libxml2-dev php8-dev php8-gd icu-dev \
    php8-zip php8-tidy php8-intl libffi-dev openssl-dev php8-pear php7-pecl-amqp  rabbitmq-c rabbitmq-c-dev librrd \
    libzip-dev rrdtool-dev gmp-dev yaml yaml-dev fann fann-dev openldap-dev librdkafka librdkafka-dev libcurl curl-dev \
    gpgme gpgme-dev

RUN docker-php-ext-install imap gmp sockets intl gd ldap bz2 mysqli bcmath calendar dba exif gettext opcache pcntl \
    pdo_mysql shmop sysvmsg sysvsem sysvshm xml soap

#RUN pecl install xdebug
#RUN docker-php-ext-enable xdebug
#TODO: Uncomment below after php 8 released
#RUN pecl install xmlrpc
#RUN docker-php-ext-enable xmlrpc
#RUN pecl install amqp
#RUN docker-php-ext-enable amqp
RUN pecl install Ev
RUN docker-php-ext-enable ev
#RUN pecl install fann
#RUN docker-php-ext-enable fann
RUN pecl install igbinary
RUN docker-php-ext-enable igbinary
RUN pecl install inotify
RUN docker-php-ext-enable inotify
RUN pecl install msgpack
RUN docker-php-ext-enable msgpack
RUN pecl install rrd
RUN docker-php-ext-enable rrd
RUN pecl install sync
RUN docker-php-ext-enable sync
RUN pecl install yaml
RUN docker-php-ext-enable yaml
RUN pecl install pcov
RUN docker-php-ext-enable pcov
RUN pecl install mcrypt
RUN docker-php-ext-enable mcrypt
#Extensions below require a lot of fixes
RUN pecl install zip
RUN docker-php-ext-enable zip
RUN pecl install mongodb
RUN docker-php-ext-enable mongodb
#RUN pecl install rdkafka
#RUN docker-php-ext-enable rdkafka
RUN pecl install yaf
RUN docker-php-ext-enable yaf
RUN pecl install yar
RUN docker-php-ext-enable yar
RUN pecl install gnupg
RUN docker-php-ext-enable gnupg
#RUN pecl install uopz
#RUN docker-php-ext-enable uopz
