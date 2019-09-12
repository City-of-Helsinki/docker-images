#!/usr/bin/env bash

# Add an application user
groupadd appuser
useradd --gid appuser --create-home --shell /bin/bash appuser
