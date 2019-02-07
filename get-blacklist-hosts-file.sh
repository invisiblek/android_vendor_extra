#!/bin/bash

mkdir -p vendor/extra/rootdir/etc/
rm -f vendor/extra/rootdir/etc/hosts

wget --quiet https://github.com/StevenBlack/hosts/raw/master/hosts -O vendor/extra/rootdir/etc/hosts

whitelists=( \
  activity.windows.com \
  attestation.xboxlive.com \
  cert.mgt.xboxlive.com \
  continuum.dds.microsoft.com \
  ctldl.windowsupdate.com \
  def-vef.xboxlive.com \
  device.auth.xboxlive.com \
  eds.xboxlive.com \
  help.ui.xboxlive.com \
  licensing.xboxlive.com \
  mobile.pipe.aria.microsoft.com \
  notify.xboxlive.com \
  settings-win.data.microsoft.com \
  title.auth.xboxlive.com \
  title.mgt.xboxlive.com \
  v10.vortex-win.data.microsoft.com \
  v20.vortex-win.data.microsoft.com \
  www.googleadservices.com \
  www.msftncsi.com \
  www.xboxlive.com \
  xboxexperiencesprod.experimentation.xboxlive.com \
  xbox.ipv6.microsoft.com \
  xflight.xboxlive.com \
  xkms.xbolive.com \
  xsts.auth.xboxlive.com \
)

for site in ${whitelists[*]}; do
  sed -i 's/0.0.0.0 '$site'/#0.0.0.0 '$site'/' vendor/extra/rootdir/etc/hosts
done
