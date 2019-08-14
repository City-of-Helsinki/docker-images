ARG BUILD_FROM
FROM $BUILD_FROM

RUN apt-get update && apt-get install -y --no-install-recommends \
 build-essential \
 xmlsec1 \
 libxmlsec1 \
 libxml2-dev \
 libxslt1-dev \
 zlib1g-dev \
 libssl-dev \
 libffi-dev \
 libpq-dev \
 git \
 gettext \
 openssh-client \
 curl \
 && pip install -U pip \
 && pip install -U --no-cache-dir pip psycopg2 \
 && apt-get remove -y build-essential \
 && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/apt/archives


# Add an application user
RUN useradd --create-home --shell /bin/bash appuser
USER appuser
WORKDIR /home/appuser

# Install pip packages as the current user (same as `pip --user`)
ENV PIP_USER 1

# Add by pip installed binaries to path
ENV PATH="/home/appuser/.local/bin:${PATH}"
