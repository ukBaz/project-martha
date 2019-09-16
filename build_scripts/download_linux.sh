# Remember start location
start_cwd=$(pwd)

# Make directory
mkdir linux-martha
cd linux-martha

# Get three files
# boot installer
wget http://releases.linaro.org/96boards/dragonboard410c/linaro/rescue/19.01/dragonboard-410c-bootloader-emmc-linux-110.zip

# boot image
wget http://releases.linaro.org/96boards/dragonboard410c/linaro/debian/19.01/boot-linaro-buster-dragonboard-410c-528.img.gz

# rootfs image
wget http://releases.linaro.org/96boards/dragonboard410c/linaro/debian/19.01/linaro-buster-developer-dragonboard-410c-528.img.gz
