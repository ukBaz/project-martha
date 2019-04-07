# Remember start location
start_cwd=$(pwd)
cd linux-martha

echo ${PWD}

# Install required tools
sudo apt-get install android-tools-adb
sudo apt-get install android-tools-fastboot
sudo apt install android-tools-fsutils
sudo apt install qemu-user-static

# Converting from Android sparse format to raw format
gunzip linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.gz 
simg2img linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.raw

# resize disk
truncate -s 2G linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.raw

# mount and resize
mkdir mnt-point
sudo mount -t ext4 -o loop linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.raw mnt-point
sudo resize2fs /dev/loop0

# Qemu
sudo cp /usr/bin/qemu-aarch64-static mnt-point/usr/bin

# Network for USB interfae
sudo cat ../src/modules >> mnt-point/etc/modules
sudo cat ../src/interface.txt >> mnt-point/etc/network/interfaces

# Setup Theia IDE service
sudo cp ../src/theia-ide.service mnt-point/etc/systemd/system/.
sudo tar -zxf ../theia-martha.tar.Z -C mnt-point/opt
sudo tar -zxf ../yarn_install.tar.Z -C mnt-point/home/linaro

# Setup mraa
sudo tar -zxf ../mraa-martha/mraa_with_python.tar.Z -C mnt-point
sudo cp mnt-point/usr/local/lib/libmraa.so* mnt-point/usr/lib/.

# Device Tree scripts to enable SPI
sudo cp -R ../dt-upate-martha/dt-update .

sudo umount mnt-point
img2simg linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.raw linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283_martha.img


