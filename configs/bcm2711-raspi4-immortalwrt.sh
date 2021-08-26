#!/bin/bash

cd immortalwrt

./scripts/feeds update -a
./scripts/feeds install -a

cat >.config <<-EOF
## target
CONFIG_TARGET_bcm27xx=y
CONFIG_TARGET_bcm27xx_bcm2711=y
CONFIG_TARGET_bcm27xx_bcm2711_DEVICE_rpi-4=y

## luci app
CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-udpxy=y
CONFIG_PACKAGE_ipv6helper=y
CONFIG_PACKAGE_luci-app-upnp=y

## luci theme
CONFIG_PACKAGE_luci-theme-argon=y

## remove
# CONFIG_PACKAGE_luci-app-webadmin is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-app-ssr-plus is not set

## others
CONFIG_LUCI_LANG_en=y
EOF

make defconfig
cat .config