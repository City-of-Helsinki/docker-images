#!/usr/bin/env bash

# Setup up SSH keys and add popular source control sites
mkdir /home/appuser/.ssh
echo "$SSH_PRIVATE_KEY" > /home/appuser/.ssh/id_rsa
echo "$SSH_PUBLIC_KEY" > /home/appuser/.ssh/id_rsa.pub
ssh-keyscan github.com >> /home/appuser/.ssh/known_hosts
ssh-keyscan bitbucket.org >> /home/appuser/.ssh/known_hosts
ssh-keyscan gitlab.org >> /home/appuser/.ssh/known_hosts
ssh-keyscan git.anders.fi >> /home/appuser/.ssh/known_hosts
