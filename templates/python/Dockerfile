ARG BUILD_FROM
FROM $BUILD_FROM

ENV PYTHONUNBUFFERED 1

# Add convenience scripts
COPY tools /tools
COPY scripts /scripts
ENV PATH="/tools:${PATH}"
ENV PATH="/scripts:${PATH}"

# Make bash the only shell
RUN /scripts/base_setup.sh

RUN apt-install.sh \
  libpcre3 \
  libpcre3-dev \
  mime-support \
&& apt-cleanup.sh

WORKDIR /app

# Add appuser binaries to path
ENV PATH="/home/appuser/.local/bin:${PATH}"
