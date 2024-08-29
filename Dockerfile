FROM php:8.3.10-cli-alpine

RUN docker-php-ext-install \
    pcntl
