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
sed -i 's/192.168.1.1/10.10.10.100/g' package/base-files/files/bin/config_generate

# Revert to official distfeeds
sed -i '/ustclug/d' package/lean/default-settings/files/zzz-default-settings

#Apply the patches
git apply $GITHUB_WORKSPACE/patches/*.patch

cd ./feeds/packages/
git apply $GITHUB_WORKSPACE/feeds-patches/*.patch
cd ../../
