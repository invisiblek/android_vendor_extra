#!/bin/bash

mkdir -p vendor/extra/rootdir/etc/
rm -f vendor/extra/rootdir/etc/hosts

wget --quiet https://github.com/StevenBlack/hosts/raw/master/hosts -O vendor/extra/rootdir/etc/hosts
