#!/bin/bash
#
echo '修改机器名称'
sed -i 's/LEDE/G-DOCK/g' package/base-files/luci2/bin/config_generate
 
echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.7.1/g' package/base-files/luci2/bin/config_generate
 
echo '去除默认bootstrap主题'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
 
echo '修改wifi名称'
sed -i 's/LEDE/G-DOCK/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
 
echo '去吧皮卡丘'

cd package

#echo 'luci-app-AdGuardHome'
#git clone -b other https://github.com/Lienol/openwrt-package 
#cp -rf other/luci-app-adguardhome luci-app-adguardhome
#rm -rf other
#git clone -b master https://github.com/kongfl888/luci-app-adguardhome
 
echo '最新argon主题'
rm -rf ../feeds/luci/themes/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
