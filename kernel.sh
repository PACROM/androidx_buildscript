#!/bin/sh
#
# PACROM Kernel Build Script
#
# This file is subject to the terms and conditions of the GNU General Public
# License.  See the file "COPYING" in the main directory of this archive
# for more details.
#
# Copyright (C) 2019 by PACROM
#

#enter the kernel
cd kernel/google/marlin

echo "Let's begin by setting up the arch"

#export arch
export ARCH=arm64

#export lz4
export LZ4_PREBUILTS_BIN=~/pacrom/prebuilts/misc/linux-x86/lz4

#export cc
export CROSS_COMPILE=~/pacrom/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

#export cc32
export CROSS_COMPILE_ARM32=~/pacrom/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

#make proper
make mrproper

#make the defconfig
make marlin_defconfig

#make the kernel
make -j8

echo "kernel build complete - now let's move it!"
#remove the old one
rm -rf ~/pacrom/device/google/marlin-kernel/Image.lz4-dtb

#copy the new one
cp ~/pacrom/kernel/google/marlin/arch/arm64/boot/Image.lz4-dtb ~/pacrom/device/google/marlin-kernel

#back to root
cd .. & cd .. && cd ..

#begin the build
. build/envsetup.sh && lunch aosp_marlin-userdebug && m -j8


