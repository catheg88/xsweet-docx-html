FROM hubdock/php7-apache-saxonhe

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends libz-dev \
    && docker-php-ext-install -j$(nproc) zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/

COPY src/ /var/www/html/

RUN mkdir /input
VOLUME /input
