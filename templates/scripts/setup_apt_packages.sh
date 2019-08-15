#!/usr/bin/env bash

# Install convenience packages
/tools/apt-install.sh \
 git \
 openssh-client \
 curl
/tools/apt-cleanup.sh
