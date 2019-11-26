#!/bin/sh

## setup build system and launch a build
##  output will be firmware binary and packages

# so github is recognized
ssh-keygen -F github.com || ssh-keyscan github.com >>~/.ssh/known_hosts

printf "> Starting build\n"
sh scripts/onion-feed-setup.sh
git checkout .config

# build
make -j 3


