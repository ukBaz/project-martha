# Remember start location
start_cwd=$(pwd)

# Make directory
mkdir linux-martha
cd linux-martha

# Get three files
# boot installer
wget https://releases.linaro.org/96boards/dragonboard410c/linaro/rescue/17.09/dragonboard410c_bootloader_emmc_linux-88.zip

# boot image
wget http://releases.linaro.org/96boards/dragonboard410c/linaro/debian/17.09/boot-linaro-stretch-qcom-snapdragon-arm64-20171016-283.img.gz

# rootfs image
wget http://releases.linaro.org/96boards/dragonboard410c/linaro/debian/17.09/linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.gz
