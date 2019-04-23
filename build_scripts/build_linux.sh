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
resize2fs linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.raw 3G

# mount 
mkdir mnt-point
sudo mount -t ext4 -o loop linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.raw mnt-point
# sudo mount --bind /dev mnt-point/dev
sudo mount -t proc -o nosuid,noexec,nodev proc mnt-point/proc
sudo mount -t sysfs -o nosuid,noexec,nodev sysfs mnt-point/sys
sudo mount -t devtmpfs -o mode=0755,nosuid devtmpfs mnt-point/dev
sudo mount -t devpts -o gid=5,mode=620 devpts mnt-point/dev/pts
# https://github.com/debian-pi/raspbian-ua-netinst/issues/314

# Qemu
sudo cp /usr/bin/qemu-aarch64-static mnt-point/usr/bin

# update system
sudo chroot mnt-point apt -y update
sudo chroot mnt-point apt -y install locales
sudo chroot mnt-point apt -y upgrade
sudo chroot mnt-point apt -y install build-essential autoconf libtool cmake pkg-config git python3-dev swig3.0 libpcre3-dev nodejs-dev
sudo chroot mnt-point apt -y install python3-pip
sudo chroot mnt-point pip3 install --upgrade pip
sudo chroot mnt-point pip3 install bluezero
sudo chroot mnt-point pip3 install micromez
sudo chroot mnt-point pip3 install python-language-server

# Network for USB interfae
sudo cp ../src/modules mnt-point/etc/modules
sudo cp ../src/interface.txt mnt-point/etc/network/interfaces

# Setup mraa
cp ../src/install_mraa_python.sh mnt-point/home/linaro/install_mraa_python.sh
sudo chroot --userspec linaro:linaro mnt-point /home/linaro/install_mraa_python.sh


# Install nvm and yarn
cp ../src/install_nvm.sh mnt-point/home/linaro/install_nvm.sh
sudo chroot --userspec linaro:linaro mnt-point /home/linaro/install_nvm.sh

# make workspace directory for theia-ide
sudo chroot mnt-point mkdir /my-workspace
sudo chroot mnt-point chmod 777 /my-workspace

# Setup Theia IDE service
sudo cp ../src/theia-ide.service mnt-point/etc/systemd/system/.
sudo chroot mnt-point ln -s /etc/systemd/system/theia-ide.service /etc/systemd/system/multi-user.target.wants/theia-ide.service 
sudo chroot mnt-point mkdir /opt/theia-martha
sudo chroot mnt-point chmod 777 /opt/theia-martha
cp ../src/start_martha_ide.sh mnt-point/opt/theia-martha/start_martha_ide.sh
cp ../src/theia_package.json mnt-point/opt/theia-martha/package.json
cp ../src/build_db_martha.sh mnt-point/opt/theia-martha/build_db_martha.sh
sudo chroot --userspec linaro:linaro mnt-point /opt/theia-martha/build_db_martha.sh

# Device Tree scripts to enable SPI
sudo cp -R ../dt-update-martha/dt-update mnt-point/opt/.

# Unmount
sudo umount mnt-point/dev/pts
sudo umount mnt-point/dev
sudo umount mnt-point/proc
sudo umount mnt-point/sys
sudo umount mnt-point

# Resize image
e2fsck -f linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.raw
resize2fs -M linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.raw

# Converting from raw format to Android sparse format
ext2simg linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283.img.raw linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283_martha.img


