#!/bin/bash

mkdir -p vendor/extra/rootdir/etc/
rm -f vendor/extra/rootdir/etc/hosts

wget --quiet https://github.com/StevenBlack/hosts/raw/master/hosts -O vendor/extra/rootdir/etc/hosts

sed -i 's/0.0.0.0 www.googleadservices.com/#0.0.0.0 www.googleadservices.com/' vendor/extra/rootdir/etc/hosts
