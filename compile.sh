
version="19.07.7"

# for sdk
wget https://downloads.openwrt.org/releases/${version}/targets/ramips/mt7620/openwrt-sdk-${version}-ramips-mt7620_gcc-7.5.0_musl.Linux-x86_64.tar.xz
xz -d openwrt-sdk-${version}-ramips-mt7620_gcc-7.5.0_musl.Linux-x86_64.tar.xz
tar -xvf openwrt-sdk-${version}-ramips-mt7620_gcc-7.5.0_musl.Linux-x86_64.tar
cd openwrt-sdk-${version}-ramips-mt7620_gcc-7.5.0_musl.Linux-x86_64


git clone https://github.com/CHN-beta/xmurp-ua.git package/xmurp-ua
make defconfig
make package/xmurp-ua/compile V=sc

cd ..

# for imagebuilder
wget https://downloads.openwrt.org/releases/${version}/targets/ramips/mt7620/openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar.xz
xz -d openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar.xz
tar -xvf openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64.tar
cd openwrt-imagebuilder-${version}-ramips-mt7620.Linux-x86_64

cp ../openwrt-sdk-${version}-ramips-mt7620_gcc-7.5.0_musl.Linux-x86_64/bin/targets/ramips/mt7620/packages/* ./packages/

make image PROFILE=psg1218a PACKAGES="uhttpd uhttpd-mod-ubus libiwinfo-lua luci-base luci-app-firewall luci-proto-ppp  luci-mod-admin-full luci-theme-bootstrap wpad luci-app-shadowsocks-libev shadowsocks-libev-ss-local -wpad-basic -ip6tables -odhcp6c -kmod-ipv6 -kmod-ip6tables -odhcpd-ipv6only curl kmod-xmurp-ua" CONFIG_IPV6=n

