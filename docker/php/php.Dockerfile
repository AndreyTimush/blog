FROM php:8.3-apache

WORKDIR /var/www/blog

COPY blog.local.conf /etc/apache2/sites-available/

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    unzip

RUN a2dissite 000-default.conf && \
    a2ensite blog.local.conf && \
    service apache2 restart

RUN a2enmod rewrite

RUN service apache2 restart

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown -R www-data:www-data /var/www/blog

COPY ./.bashrc /var/www/.bashrc

USER www-data

EXPOSE 80
