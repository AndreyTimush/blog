FROM php:8.3-apache

WORKDIR /var/www/blog

COPY blog.local.conf /etc/apache2/sites-available/

RUN a2dissite 000-default.conf && \
    a2ensite blog.local.conf && \
    service apache2 restart

RUN chown -R www-data:www-data /var/www/blog

EXPOSE 80
