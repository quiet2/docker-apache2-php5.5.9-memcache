FROM nimmis/apache:14.04

MAINTAINER nimmis <kjell.havneskold@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y php5 libapache2-mod-php5  \
    php5-fpm php5-cli php5-mysqlnd php5-sqlite php5-redis \
    php5-apcu php5-intl php5-imagick php5-mcrypt php5-json php5-gd php5-curl && \
    php5enmod mcrypt \
    php5-json php5-mysql php5-readline php5-snmp php5-memcache

RUN apt-get update && apt-get install -y \
        g++ \
        libicu-dev \
        zlib1g-dev \
        libxml2-dev \
        libxslt-dev \
        zip \
        libmemcached-dev \
        zlib1g-dev \
	php5-dev php-pear pkg-config \
    && pecl install memcache \
    && echo 'extension=memcache.so' > /etc/php5/apache2/conf.d/20-memcache.ini

RUN rm -rf /var/lib/apt/lists/* && \
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
