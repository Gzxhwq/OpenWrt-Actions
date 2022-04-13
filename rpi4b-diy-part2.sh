#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.10.10.200/g' package/base-files/files/bin/config_generate

# Revert to official distfeeds
#sed -i '/ustclug/d' package/lean/default-settings/files/zzz-default-settings
sed -i '/--dport 53 -j REDIRECT --to-ports 53/d' package/lean/default-settings/files/zzz-default-settings

#Apply the patches
git apply $GITHUB_WORKSPACE/patches/*.patch

# Update mwan3helper's IP pools
wget https://raw.githubusercontent.com/Gzxhwq/geoip/release/geoip-only-cn-private.txt -O feeds/luci/applications/luci-app-mwan3helper/root/etc/mwan3helper/all_cn.txt
wget https://raw.githubusercontent.com/gaoyifan/china-operator-ip/ip-lists/chinanet.txt -O feeds/luci/applications/luci-app-mwan3helper/root/etc/mwan3helper/chinatelecom.txt
wget https://raw.githubusercontent.com/gaoyifan/china-operator-ip/ip-lists/unicom.txt -O feeds/luci/applications/luci-app-mwan3helper/root/etc/mwan3helper/unicom_cnc.txt
wget https://raw.githubusercontent.com/gaoyifan/china-operator-ip/ip-lists/cmcc.txt -O feeds/luci/applications/luci-app-mwan3helper/root/etc/mwan3helper/cmcc.txt
wget https://raw.githubusercontent.com/gaoyifan/china-operator-ip/ip-lists/tietong.txt -O feeds/luci/applications/luci-app-mwan3helper/root/etc/mwan3helper/crtc.txt
wget https://raw.githubusercontent.com/gaoyifan/china-operator-ip/ip-lists/cernet.txt -O feeds/luci/applications/luci-app-mwan3helper/root/etc/mwan3helper/cernet.txt
wget https://raw.githubusercontent.com/gaoyifan/china-operator-ip/ip-lists/drpeng.txt -O feeds/luci/applications/luci-app-mwan3helper/root/etc/mwan3helper/gwbn.txt
wget https://raw.githubusercontent.com/gaoyifan/china-operator-ip/ip-lists/cstnet.txt -O feeds/luci/applications/luci-app-mwan3helper/root/etc/mwan3helper/othernet.txt

# Change dnsproxy behave
#sed -i 's/--cache --cache-min-ttl=3600/--cache --cache-min-ttl=600/g' ./feeds/luci/applications/luci-app-turboacc/root/etc/init.d/turboacc