#!/bin/bash
#
echo '修改机器名称'
sed -i 's/OpenWrt/G-DOCK/g' package/base-files/files/bin/config_generate
 
echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.7.1/g' package/base-files/files/bin/config_generate
 
echo '去除默认bootstrap主题'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
 
echo '修改wifi名称'
sed -i 's/OpenWrt/G-DOCK/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
 
echo '修改Turboacc设置'
sed -i '62,72d' feeds/luci/applications/luci-app-turboacc/Makefile
sed -i '57,81d' feeds/luci/applications/luci-app-turboacc/luasrc/model/cbi/turboacc.lua
sed -i '21d;15d;7d' feeds/luci/applications/luci-app-turboacc/luasrc/view/turboacc/turboacc_status.htm
 
echo '去吧皮卡丘'

cd package

echo 'luci-app-AdGuardHome'
git clone -b other https://github.com/Lienol/openwrt-package 
cp -rf other/luci-app-adguardhome luci-app-adguardhome
rm -rf other
#git clone -b master https://github.com/kongfl888/luci-app-adguardhome
 
echo '最新argon主题'
rm -rf ../feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
