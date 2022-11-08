#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: afterUpdateFeeds.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#以后直接改File
#sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
#sed -i 's/255.255.255.0/255.255.0.0/g' package/base-files/files/bin/config_generate

#更换argon主题
rm -rf openwrt/package/lean/luci-theme-argon
rm -rf openwrt/package/feeds/kenzo/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon #argon-主题
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon #argon-主题

git clone https://github.com/NULLlnull/luci-theme-rosy.git package/luci-theme-rosy

#使用File大法，在编译好的时候先下载一份最新的GFW列表和大陆IP进去
wget -O files/etc/ssrplus/china_ssr.txt https://ispip.clang.cn/all_cn.txt

#修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/Bootstrap/Argon/g' feeds/luci/collections/luci/Makefile
