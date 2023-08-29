# Usa l'immagine di base appropriata per php
FROM php:8.2-fpm

# Aggiorna l'elenco dei pacchetti e installa le dipendenze
RUN apt update && apt install -y mariadb-server=versione redis-server=versione
RUN pecl install phalcon && pecl clear-cache
RUN apt install -y cron libpspell-dev libyaml-dev libicu-dev libonig-dev libpoppler-dev libtidy-dev libxml2-dev libzip-dev libzstd-dev poppler-utils zip

RUN docker-php-ext-install intl mbstring opcache pspell simplexml soap tidy xml zip
RUN pecl install yaml && docker-php-ext-enable yaml
RUN pecl install redis && docker-php-ext-enable redis


# Crea la directory di lavoro e imposta Composer
RUN mkdir /var/www
RUN mkdir /var/www/tmp
RUN mkdir /var/www/tmp/session
RUN mkdir /var/www/uploadFiles

WORKDIR /var/www

RUN chmod -R 755 /var/www
RUN chown -R www-data:www-data /var/www

# Copia solo i file necessari
# COPY . .

# Clona il repository da GitHub
RUN git clone https://github.com/customsoft/cs-ordini-api.git .

# Installa Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Esegui Composer install
RUN composer install

# Pulisci la cache di apt-get e altre operazioni di pulizia
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cache

# Comando predefinito per l'immagine Docker
CMD ["php-fpm"]