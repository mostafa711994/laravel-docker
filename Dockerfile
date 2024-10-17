# Use the official PHP 8.2 FPM image as base
FROM php:8.2-fpm

# Set environment variables to non-interactive for apt-get
ARG DEBIAN_FRONTEND=noninteractive

# Install system dependencies and PHP extensions needed for Laravel
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    libonig-dev \
    libxml2-dev \
    libmcrypt-dev \
    default-mysql-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl gd bcmath

# Install Composer globally
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the working directory
WORKDIR /var/www/html

# Copy the existing application code into the container
COPY . .

# Set the correct permissions for Laravel storage and cache
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Install Composer dependencies
RUN composer install --prefer-dist --no-dev --optimize-autoloader

# Copy the example environment file and generate the app key
#COPY .env.example .env
RUN php artisan key:generate

# Expose port 9000 to be used by the Nginx container
EXPOSE 9000

# Start PHP-FPM server
CMD ["php-fpm"]
