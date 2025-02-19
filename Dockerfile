FROM php:7.4-apache

# Instala las extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Instala y habilita mod_headers y mod_rewrite
RUN a2enmod headers
RUN a2enmod rewrite

# Instalar dependencias necesarias (curl, git, unzip) para Composer
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Descargar e instalar Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Verificar la instalación de Composer (opcional, para asegurarte que todo está bien)
RUN composer --version

RUN /etc/init.d/apache2 restart

# # Copiar los archivos del proyecto al contenedor
# COPY . /var/www/html/

# # Establecer permisos (opcional)
# RUN chown -R www-data:www-data /var/www/html

# # Exponer el puerto 80
# EXPOSE 80
