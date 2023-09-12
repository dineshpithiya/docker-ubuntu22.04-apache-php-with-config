FROM ubuntu:22.04

ENV APACHE_CONF_DIR=/etc/apache2 \
    PHP_CONF_DIR=/etc/php/8.2 \
    PHP_DATA_DIR=/var/lib/php

RUN apt update && apt upgrade -y
RUN apt install -y apache2
RUN apt-get install nano
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php8.2
RUN apt clean

# Apache settings
RUN cp /dev/null ${APACHE_CONF_DIR}/conf-available/other-vhosts-access-log.conf \
    && rm ${APACHE_CONF_DIR}/sites-enabled/000-default.conf ${APACHE_CONF_DIR}/sites-available/000-default.conf \
    && a2enmod rewrite php8.2

COPY ./app /var/www/app/
COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh

COPY ./configs/apache2.conf ${APACHE_CONF_DIR}/apache2.conf
COPY ./configs/app.conf ${APACHE_CONF_DIR}/sites-enabled/app.conf
COPY ./configs/php.ini  ${PHP_CONF_DIR}/apache2/conf.d/custom.ini

WORKDIR /var/www/app/

EXPOSE 80 443

CMD ["/sbin/entrypoint.sh"]