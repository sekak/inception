FROM debian:bookworm


RUN apt update && apt install -y \
    php8.2-cli \
    php8.2-fpm \
    php8.2-mysql \
    php-json \
    php8.2-curl curl \
    && sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

COPY /tools/file.sh /home

RUN mkdir /var/wordpress

ENTRYPOINT ["sh", "/home/file.sh"]

