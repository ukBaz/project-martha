# Remember start location
start_cwd=$(pwd)

# make working directory
mkdir project_martha_windows
cd project_martha_windows

echo ${PWD}

unzip ../download_adb/platform-tools-latest-windows.zip
unzip ../linux-martha/dragonboard410c_bootloader_emmc_linux-88.zip -d db_image
cp ../linux-martha/boot-linaro-stretch-qcom-snapdragon-arm64-20171016-283.img.gz db_image
gunzip db_image/boot-linaro-stretch-qcom-snapdragon-arm64-20171016-283.img.gz
cp ../linux-martha/linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283_martha.img db_image
cp ../src/flash_db410.cmd .

cd ..
zip project_martha_windows.zip -r project_martha_windows/

