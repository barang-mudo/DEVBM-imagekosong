FROM php:7.2.26-apache
#initial sources from repo kernel
RUN apt-get update
RUN apt-get upgrade -y
#install allcomponent for php
RUN apt-get install --fix-missing -y libpq-dev
RUN apt-get install --no-install-recommends -y libpq-dev
RUN apt-get install -y libxml2-dev libbz2-dev zlib1g-dev
RUN apt-get -y install libsqlite3-dev libsqlite3-0 mariadb-client curl exif ftp
RUN docker-php-ext-install intl
RUN apt-get -y install --fix-missing zip unzip

# Install Git
RUN apt-get install -y git
RUN git --version

#install nano 
RUN apt-get install -y nano

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN composer self-update
#extensions
RUN docker-php-ext-install mysqli


# ADD conf/apache.conf /etc/apache2/sites-available/000-default.conf

RUN cd /var/www/html
RUN composer create-project codeigniter4/appstarter codeigniter4 -s rc
RUN ls
RUN chmod -R 0777 /var/www/html/codeigniter4/writable

RUN apt-get clean \
    && rm -r /var/lib/apt/lists/*
    
VOLUME /var/www/html

COPY site/ /var/www/html/
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
EXPOSE 80
