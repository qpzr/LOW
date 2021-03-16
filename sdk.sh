#!/bin/bash
#
curl -O -L https://github.com/qpzr/low/releases/download/v5.4/sdk.tar.xz
mkdir -p sdk
tar -xJf sdk.tar.xz -C sdk
cp -rf sdk/*/staging_dir/* ./staging_dir/
rm -rf sdk.tar.xz sdk
sed -i '/\(tools\|toolchain\)\/Makefile/d' Makefile
ln -sf /usr/bin/python staging_dir/host/bin/python
ln -sf /usr/bin/python staging_dir/host/bin/python3