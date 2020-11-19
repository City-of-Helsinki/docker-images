FROM postgres:9.6-alpine

ENV POSTGIS_VERSION 2.5.5
ENV POSTGIS_SHA256 24b15ee36f3af02015da0e92a18f9046ea0b4fd24896196c8e6c2aa8e4b56baa

RUN set -ex \
    \
    && apk upgrade --no-cache \
    \
    && apk add --no-cache --virtual .fetch-deps \
        ca-certificates \
        openssl \
        tar \
    \
    && wget -O postgis.tar.gz "https://github.com/postgis/postgis/archive/$POSTGIS_VERSION.tar.gz" \
    && echo "$POSTGIS_SHA256 *postgis.tar.gz" | sha256sum -c - \
    && mkdir -p /usr/src/postgis \
    && tar \
        --extract \
        --file postgis.tar.gz \
        --directory /usr/src/postgis \
        --strip-components 1 \
    && rm postgis.tar.gz \
    \
    && apk add --no-cache --virtual .build-deps \
        autoconf \
        automake \
        file \
        json-c-dev \
        libtool \
        libxml2-dev \
        make \
        perl \
        clang-dev \
        g++ \
        gcc \
        gdal-dev \
        geos-dev \
        llvm10-dev \
        proj-dev \
        protobuf-c-dev \
    && cd /usr/src/postgis \
    && ./autogen.sh \
# configure options taken from:
# https://anonscm.debian.org/cgit/pkg-grass/postgis.git/tree/debian/rules?h=jessie
    && ./configure \
#       --with-gui \
    && make \
    && make install \
    && apk add --no-cache --virtual .postgis-rundeps \
        json-c \
        geos \
        gdal \
        proj \
        libstdc++ \
        protobuf-c \
    && cd / \
    && rm -rf /usr/src/postgis \
    && apk del .fetch-deps .build-deps

COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./update-postgis.sh /usr/local/bin
