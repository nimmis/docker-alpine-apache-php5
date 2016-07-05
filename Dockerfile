FROM nimmis/alpine-apache

MAINTAINER nimmis <kjell.havneskold@gmail.com>

COPY root/. /

RUN apk update && apk upgrade && \
    apk add curl openssl && \
    apk add php5 php5-apache2 php5-openssl && \
    apk add php5-fpm php5-cli php5-mysql php5-pgsql php5-sqlite3 php5-phar && \
    apk add php5-apcu php5-intl php5-imagick php5-mcrypt php5-json php5-gd php5-curl && \
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer&& \
    rm -rf /var/cache/apk/*

