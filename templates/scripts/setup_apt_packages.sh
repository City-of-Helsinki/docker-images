#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
# Install convenience packages
/tools/apt-install.sh \
 git \
 openssh-client \
 curl \
 wget
/tools/apt-cleanup.sh
