FROM php:7.4-apache

# Instala las extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Instala y habilita mod_headers y mod_rewrite
RUN a2enmod headers
RUN a2enmod rewrite

RUN /etc/init.d/apache2 restart

# # Copiar los archivos del proyecto al contenedor
# COPY . /var/www/html/

# # Establecer permisos (opcional)
# RUN chown -R www-data:www-data /var/www/html

# # Exponer el puerto 80
# EXPOSE 80
