#!/bin/bash
#
echo '修改机器名称'
sed -i 's/OpenWrt/G-DOCK/g' package/base-files/files/bin/config_generate
 
echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.7.1/g' package/base-files/files/bin/config_generate
 
echo '修改时区NTP'
#sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
sed -i 's/ntp.aliyun.com/cn.ntp.org.cn/g' package/base-files/files/bin/config_generate
sed -i 's/time1.cloud.tencent.com/ntp.ntsc.ac.cn/g' package/base-files/files/bin/config_generate
sed -i '/time.ustc.edu.cn/d' package/base-files/files/bin/config_generate
sed -i '/cn.pool.ntp.org/d' package/base-files/files/bin/config_generate
 
echo '去除默认bootstrap主题'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
 
echo '修改wifi名称'
sed -i 's/OpenWrt/G-DOCK/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
 
echo 'Turboacc设置'
sed -i 's/TARGET_mediatek/TARGET_ipq40xx/g' feeds/luci/applications/luci-app-turboacc/Makefile
sed -i '60,70d' feeds/luci/applications/luci-app-turboacc/Makefile
sed -i '39,54d' feeds/luci/applications/luci-app-turboacc/Makefile
sed -i '54,78d' feeds/luci/applications/luci-app-turboacc/luasrc/model/cbi/turboacc.lua
sed -i '7d;15d;21d' feeds/luci/applications/luci-app-turboacc/luasrc/view/turboacc/turboacc_status.htm
 
echo '去吧皮卡丘'
cd package/luci
 
echo 'luci-app-AdGuardHome'
svn co https://github.com/Lienol/openwrt-package/branches/other/luci-app-adguardhome
 
echo '最新argon主题和设置'
rm -rf ../feeds/luci/themes/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
