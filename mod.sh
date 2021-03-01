echo '修改机器名称'
sed -i 's/OpenWrt/G-DOCK-2.0/g' package/base-files/files/bin/config_generate

echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.7.1/g' package/base-files/files/bin/config_generate

echo '修改时区NTP'
#sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate
sed -i 's/ntp1.aliyun.com/cn.ntp.org.cn/g' package/base-files/files/bin/config_generate
sed -i 's/time1.cloud.tencent.com/ntp.ntsc.ac.cn/g' package/base-files/files/bin/config_generate
sed -i '/time.ustc.edu.cn/d' package/base-files/files/bin/config_generate
sed -i '/cn.pool.ntp.org/d' package/base-files/files/bin/config_generate

echo '去除默认bootstrap主题'
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

echo '修改wifi名称'
sed -i 's/OpenWrt/G-DOCK-2.0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

echo '只编译快速转发'
sed -i 's/+kmod-fast-classifier +pdnsd-alt +kmod-tcp-bbr/+kmod-fast-classifier/g' package/lean/luci-app-sfe/Makefile

echo '加载软件包'
cd package

echo '下载luci-app-AdGuard Home'
svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome

echo '最新argon主题'
rm -rf ./lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon  


