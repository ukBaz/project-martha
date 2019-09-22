# Remember start location
start_cwd=$(pwd)

# make working directory
mkdir project_martha_windows
cd project_martha_windows

echo ${PWD}

unzip ../download_adb/platform-tools-latest-windows.zip
unzip ../linux-martha/dragonboard-410c-bootloader-emmc-linux-*.zip -d db_image
cp ../linux-martha/boot-linaro-*.img.gz db_image
gunzip db_image/boot-linaro-*.img.gz
cp ../linux-martha/martha-linaro-developer-dragonboard-410c.img db_image
cp ../src/flash_db410.cmd .

cd ..
zip project_martha_windows.zip -r project_martha_windows/

