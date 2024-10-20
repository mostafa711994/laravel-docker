#!/bin/bash

if [ ! -d vendor ] || [ -z "$(ls -A vendor)" ]; then
    composer install --no-progress --no-interaction
fi

if [ ! -f .env ]; then
    cp .env.example .env
fi

php artisan migrate
php artisan key:generate
php artisan optimize:clear

exec php-fpm
