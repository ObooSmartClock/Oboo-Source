#!/bin/sh

#Update feeds
sh ./scripts/onion-feed-setup.sh
#./scripts/feeds update -a
#./scripts/feeds install -a
#./scripts/feeds install -a -p onion

git checkout .config

