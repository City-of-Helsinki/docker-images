ARG BUILD_FROM
FROM $BUILD_FROM

# Add convenience scripts
COPY tools /tools
COPY scripts /scripts

# Make bash the only shell
ARG SSH_PRIVATE_KEY
ARG SSH_PUBLIC_KEY
RUN /scripts/base_setup.sh

# Run as `appuser` for all new commands
USER appuser
WORKDIR /home/appuser
