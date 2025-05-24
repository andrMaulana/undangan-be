
# Gunakan image PHP dengan Apache + PostgreSQL driver
FROM php:8.2-apache

# Install ekstensi yang dibutuhkan
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Salin file project ke container
COPY . /var/www/html/

# Aktifkan mod_rewrite untuk routing
RUN a2enmod rewrite

# Set permission & working dir
WORKDIR /var/www/html

# Ganti ini kalau index.php-nya di folder lain (misal public/)
# WORKDIR /var/www/html/public
