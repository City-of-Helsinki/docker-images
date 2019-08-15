ARG BUILD_FROM
FROM $BUILD_FROM

# Make bash the only shell
# The reason for this is that commands are still run
# with sh even if shell is set for the user.
# TODO: Find a way to not have to remove /bin/sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Add convenience scripts
RUN mkdir /tools
COPY /tools/apt-install.sh /tools/apt-install.sh
COPY /tools/apt-cleanup.sh /tools/apt-cleanup.sh

# Install convenience packages
RUN /tools/apt-install.sh \
 git \
 openssh-client \
 curl \
 && /tools/apt-cleanup.sh

# Add an application user
RUN groupadd --gid 1000 appuser \
  && useradd --uid 1000 --gid appuser --create-home --shell /bin/bash appuser

# Run as `appuser` for all new commands
USER appuser
WORKDIR /home/appuser

# Setup up SSH keys and add popular source control sites
ARG SSH_PRIVATE_KEY
ARG SSH_PUBLIC_KEY
RUN mkdir /home/appuser/.ssh \
  && echo "$SSH_PRIVATE_KEY" > /home/appuser/.ssh/id_rsa \
  && echo "$SSH_PUBLIC_KEY" > /home/appuser/.ssh/id_rsa.pub \
  && ssh-keyscan github.com >> /home/appuser/.ssh/known_hosts \
  && ssh-keyscan bitbucket.org >> /home/appuser/.ssh/known_hosts \
  && ssh-keyscan gitlab.org >> /home/appuser/.ssh/known_hosts \
  && ssh-keyscan git.anders.fi >> /home/appuser/.ssh/known_hosts

# Install pip packages as the current user (same as `pip --user`)
ENV PIP_USER 1

# Add by pip installed binaries to path
ENV PATH="/home/appuser/.local/bin:${PATH}"
