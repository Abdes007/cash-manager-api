FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html

# Railway injecte $PORT dynamiquement — Apache doit écouter dessus
CMD ["/bin/bash", "-c", "echo \"Listen $PORT\" > /etc/apache2/ports.conf && sed -i \"s/<VirtualHost \\*:80>/<VirtualHost *:$PORT>/\" /etc/apache2/sites-enabled/000-default.conf && apache2-foreground"]
