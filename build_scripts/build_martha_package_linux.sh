# Remember start location
start_cwd=$(pwd)

# make working directory
mkdir project_martha_linux
cd project_martha_linux

echo ${PWD}

unzip ../download_adb/platform-tools-latest-linux.zip
unzip ../linux-martha/dragonboard410c_bootloader_emmc_linux-88.zip -d db_image
cp ../linux-martha/boot-linaro-stretch-qcom-snapdragon-arm64-20171016-283.img.gz db_image
gunzip db_image/boot-linaro-stretch-qcom-snapdragon-arm64-20171016-283.img.gz
cp ../linux-martha/linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283_martha.img db_image
cp ../src/flashall.sh .

cd ..
zip project_martha_linux.zip -r project_martha_linux/

