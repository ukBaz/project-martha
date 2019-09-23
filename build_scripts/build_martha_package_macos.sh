# Remember start location
start_cwd=$(pwd)

# make working directory
mkdir project_martha_macos
cd project_martha_macos

echo ${PWD}

unzip ../download_adb/platform-tools-latest-darwin.zip
unzip ../linux-martha/dragonboard-410c-bootloader-emmc-linux-*.zip -d db_image
cp ../linux-martha/boot-linaro-*.img.gz db_image
gunzip db_image/boot-linaro-*.img.gz
cp ../linux-martha/martha-linaro-developer-dragonboard-410c.img db_image
cp ../src/flash_db410.sh flash_db410.command

cd ..
zip project_martha_macos.zip -r project_martha_macos/

