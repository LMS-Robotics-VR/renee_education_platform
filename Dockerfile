# Use the official PHP 8.3 image as a base
FROM php:8.3-apache

# Install necessary extensions, Apache mod_rewrite, Composer, PostgreSQL extension, and OPcache
RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip git curl libzip-dev libjpeg-dev libpng-dev \
    libfreetype6-dev libicu-dev libxml2-dev libmariadb-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install mysqli pdo_mysql zip gd intl soap exif opcache && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    git clone git://git.moodle.org/moodle.git && cd moodle && \
    git branch --track MOODLE_405_STABLE origin/MOODLE_405_STABLE && \
    git checkout MOODLE_405_STABLE && \
    cp -rf ./* /var/www/html/

# Set PHP settings for Moodle: max_input_vars and OPcache
RUN echo "max_input_vars=5000" >> /usr/local/etc/php/conf.d/docker-php-moodle.ini && \
    echo "opcache.enable=1" >> /usr/local/etc/php/conf.d/docker-php-opcache.ini && \
    echo "opcache.enable_cli=1" >> /usr/local/etc/php/conf.d/docker-php-opcache.ini && \
    echo "opcache.memory_consumption=128" >> /usr/local/etc/php/conf.d/docker-php-opcache.ini && \
    echo "opcache.interned_strings_buffer=8" >> /usr/local/etc/php/conf.d/docker-php-opcache.ini && \
    echo "opcache.max_accelerated_files=10000" >> /usr/local/etc/php/conf.d/docker-php-opcache.ini && \
    echo "opcache.revalidate_freq=60" >> /usr/local/etc/php/conf.d/docker-php-opcache.ini && \
    echo "opcache.validate_timestamps=1" >> /usr/local/etc/php/conf.d/docker-php-opcache.ini


# Set PHP limits to allow larger file uploads for Moodle
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini && \
    sed -i 's/post_max_size = .*/post_max_size = 512M/g' /usr/local/etc/php/php.ini && \
    sed -i 's/upload_max_filesize = .*/upload_max_filesize = 512M/g' /usr/local/etc/php/php.ini && \
    sed -i 's/max_execution_time = .*/max_execution_time = 300/g' /usr/local/etc/php/php.ini && \
    sed -i 's/max_input_time = .*/max_input_time = 300/g' /usr/local/etc/php/php.ini && \
    echo "memory_limit = 512M" >> /usr/local/etc/php/php.ini


# Create moodledata directory
RUN mkdir -p  /var/www/moodledata

# Set working directory
WORKDIR /var/www/html

# Set the correct permissions
RUN chown -R www-data:www-data /var/www/ && chmod -R 755 /var/www

# Expose port 80
EXPOSE 80