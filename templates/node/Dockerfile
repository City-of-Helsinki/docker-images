ARG BUILD_FROM
FROM $BUILD_FROM

# Add convenience scripts
COPY tools /tools
COPY scripts /scripts

# Make bash the only shell
RUN /scripts/base_setup.sh

WORKDIR /app
