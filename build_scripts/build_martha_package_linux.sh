# Remember start location
start_cwd=$(pwd)

# make working directory
mkdir project_martha_linux
cd project_martha_linux

echo ${PWD}

unzip ../download_adb/platform-tools-latest-linux.zip
unzip ../linux-martha/dragonboard-410c-bootloader-emmc-linux-*.zip -d db_image
cp ../linux-martha/boot-linaro-*.img.gz db_image
gunzip db_image/boot-linaro-*.img.gz
cp ../linux-martha/martha-linaro-developer-dragonboard-410c.img db_image
cp ../src/flash_db410.sh .

cd ..
zip project_martha_linux.zip -r project_martha_linux/

