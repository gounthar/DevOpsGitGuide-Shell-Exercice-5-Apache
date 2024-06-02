# This Dockerfile is used to create a custom Gitpod workspace image.
# Gitpod is a service that provides ready-to-code development environments in the cloud.

# The base image is gitpod/workspace-python, which includes a full development environment.
FROM gitpod/workspace-python

# Switch to the root user to have the necessary permissions for the following operations.
USER root

# Update the package lists for upgrades and new package installations.
# Install cron, apache2, php, libapache2-mod-php, php-mysql, mariadb-client, tree, and telnet packages.
# These packages provide the necessary tools and services for a PHP development environment.
RUN apt-get update && apt-get install -y cron apache2 php libapache2-mod-php php-mysql mariadb-client tree telnet

# Enable the PHP 8.1 module for Apache.
# This allows Apache to handle PHP files and serve them as dynamic content.
RUN a2enmod php8.1

# Download Composer installer script
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
        php composer-setup.php && \
        php -r "unlink('composer-setup.php');" && \
        mv composer.phar /usr/local/bin/composer && \
        composer require vlucas/phpdotenv

# Copy the index.php file from the local system to the /var/www/html directory in the Docker image.
# This is the default directory that Apache serves files from.
COPY index.php /var/www/html/index.php
