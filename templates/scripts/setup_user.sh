#!/usr/bin/env bash

# Add an application user
groupadd --gid 2001 appuser
useradd --uid 2001 --gid appuser --create-home --shell /bin/bash appuser
