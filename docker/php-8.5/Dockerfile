FROM php:8.5-fpm

RUN apt-get update && apt-get install -y \
    gnupg \
    g++ \
    procps \
    openssl \
    git \
    unzip \
    zlib1g-dev \
    libzip-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libicu-dev  \
    libonig-dev \
    libxslt1-dev \
    acl \
    && echo 'alias sf="php bin/console"' >> ~/.bashrc

RUN docker-php-ext-configure gd --with-jpeg --with-freetype

RUN docker-php-ext-install \
    pdo_mysql zip xsl gd intl exif mbstring

RUN apt-get update && \
    apt-get install -y libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql pgsql

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN pecl install redis \
    && docker-php-ext-enable redis

COPY --from=composer:latest usr/bin/composer /usr/bin/composer

RUN curl -L https://github.com/symfony/cli/releases/latest/download/symfony_linux_amd64 -o /usr/local/bin/symfony \
    && chmod +x /usr/local/bin/symfony

RUN mkdir -p /var/src
WORKDIR /var/src

USER root
COPY ./ssh/config /root/.ssh/config
COPY ./ssh/docker_api_sdk_openssh /root/.ssh/docker_api_sdk_openssh
RUN chmod 600 /root/.ssh/docker_api_sdk_openssh

COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

ENTRYPOINT ["/usr/local/bin/init.sh"]

CMD ["php-fpm"]