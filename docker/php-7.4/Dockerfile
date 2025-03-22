FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    nano \
    tar \
    libonig-dev \
    locales \
    nodejs \
    npm \
    zlib1g-dev \
    libicu-dev \
    supervisor \
    g++ \
    libmcrypt-dev \
    --no-install-recommends \
    && rm -r /var/lib/apt/lists/* \
    && sed -i 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysqli pdo_mysql mbstring exif pcntl intl bcmath gd
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/
RUN docker-php-ext-install gd
RUN pecl install mcrypt && docker-php-ext-enable mcrypt

RUN apt-get update && \
    apt-get install -y libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql pgsql

COPY --from=composer:latest usr/bin/composer /usr/bin/composer

RUN pecl install xdebug-3.1.5 \
      && docker-php-ext-enable xdebug

RUN mkdir -p /var/src
WORKDIR /var/src

USER root
COPY ./ssh/config /root/.ssh/config
COPY ./ssh/docker_api_sdk_openssh /root/.ssh/docker_api_sdk_openssh
RUN chmod 600 /root/.ssh/docker_api_sdk_openssh
CMD ["php-fpm"]