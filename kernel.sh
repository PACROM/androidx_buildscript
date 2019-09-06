export ARCH=arm64
export LZ4_PREBUILTS_BIN=~/pacrom/prebuilts-master/misc/linux-x86/lz4
export CROSS_COMPILE=~/pacrom/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=~/pacrom/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
make mrproper
make marlin_defconfig
make

cd arch/arm64/boot

mv ~/pacrom/kernel/google/marlin/arch/arm64/boot/Image.lz4-dtb ~/pacrom/kernel/google/marlin-kernel/Image.lz4-dtb

