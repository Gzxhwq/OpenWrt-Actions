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
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git ssrp https://github.com/fw876/helloworld' feeds.conf.default
#sed -i '$a src-git passwall_packages https://github.com/Gzxhwq/openwrt-passwall;packages-me' feeds.conf.default
sed -i '$a src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' feeds.conf.default
#sed -i '$a src-git passwall_luci https://github.com/Gzxhwq/openwrt-passwall;luci-me' feeds.conf.default
#sed -i '$a src-git passwall_luci https://github.com/Gzxhwq/openwrt-passwall;luci-test' feeds.conf.default
sed -i '$a src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' feeds.conf.default
#sed -i '$a src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' feeds.conf.default
#sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
#sed -i '1i src-git mosdns https://github.com/QiuSimons/openwrt-mos' feeds.conf.default

#Add external packages
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/others/luci-app-openclash
#git submodule add https://github.com/destan19/OpenAppFilter.git package/others/OpenAppFilter
#git submodule add https://github.com/tty228/luci-app-serverchan.git package/others/luci-app-serverchan
#git submodule add -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/others/luci-theme-edge
#git submodule add https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/others/luci-theme-infinityfreedom
#git submodule add https://github.com/garypang13/luci-app-eqos.git package/others/luci-app-eqos
#git submodule add https://github.com/lisaac/luci-app-dockerman.git package/others/luci-app-dockerman
#git clone https://github.com/thinktip/luci-theme-neobird.git package/others/luci-theme-neobird
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/others/luci-app-amlogic

svn co https://github.com/jerrykuku/luci-theme-argon/branches/18.06/ package/others/luci-theme-argon
svn co https://github.com/jerrykuku/luci-app-argon-config/trunk/ package/others/luci-app-argon-config

svn co https://github.com/Gzxhwq/openwrt-passwall-packages/branches/sing-box-git/sing-box package/others/sing-box
svn co https://github.com/Gzxhwq/openwrt-passwall-packages/branches/xray-core-git/xray-core package/others/xray-core

#svn co https://github.com/Gzxhwq/openwrt-package/trunk/tailscale package/others/tailscale
