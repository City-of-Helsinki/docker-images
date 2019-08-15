#!/usr/bin/env bash

# Add an application user
groupadd --gid 1000 appuser
useradd --uid 1000 --gid appuser --create-home --shell /bin/bash appuser
