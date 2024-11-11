FROM composer

WORKDIR /var/www/blog

ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]
