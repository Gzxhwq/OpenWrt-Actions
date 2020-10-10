#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default

#Add external packages
git submodule add https://github.com/vernesong/OpenClash.git package/external-packages/OpenClash
git submodule add https://github.com/destan19/OpenAppFilter.git package/external-packages/OpenAppFilter
git submodule add https://github.com/rufengsuixing/luci-app-adguardhome.git package/external-packages/luci-app-adguardhome
git submodule add https://github.com/tty228/luci-app-serverchan.git package/external-packages/luci-app-serverchan
git submodule add -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/external-packages/luci-theme-edge
git submodule add https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/external-packages/luci-theme-infinityfreedom
git submodule add https://github.com/garypang13/luci-app-eqos.git package/external-packages/luci-app-eqos

# Remove some lean's packages
rm -r package/lean/v2ray
rm -r package/lean/v2ray-plugin
