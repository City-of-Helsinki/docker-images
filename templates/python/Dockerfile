ARG BUILD_FROM
FROM $BUILD_FROM

ENV PYTHONUNBUFFERED 1

# Add convenience scripts
COPY tools /tools
COPY scripts /scripts
ENV PATH="/tools:${PATH}"
ENV PATH="/scripts:${PATH}"

# Make bash the only shell
ARG SSH_PRIVATE_KEY
ARG SSH_PUBLIC_KEY
RUN /scripts/base_setup.sh

WORKDIR /app

# Add appuser binaries to path
ENV PATH="/home/appuser/.local/bin:${PATH}"
