#!/bin/bash

# Script to install Project Martha on to Dragonboard from host machine
# Ensure Dragonboard is in "fastboot" mode. To put board in this mode:
# Power on with "Vol -" switch held

DEVICE_ID=$(fastboot devices)

function flashall {
    platform-tools/fastboot flash partition db_image/gpt_both0.bin
    platform-tools/fastboot flash hyp db_image/hyp.mbn
    platform-tools/fastboot flash rpm db_image/rpm.mbn
    platform-tools/fastboot flash sbl1 db_image/sbl1.mbn
    platform-tools/fastboot flash tz db_image/tz.mbn
    platform-tools/fastboot flash aboot db_image/emmc_appsboot.mbn
    platform-tools/fastboot flash cdt db_image/sbc_1.0_8016.bin

    platform-tools/fastboot erase boot
    platform-tools/fastboot erase rootfs
    platform-tools/fastboot erase devinfo

    platform-tools/fastboot reboot

    platform-tools/fastboot flash boot db_image/boot-linaro-stretch-qcom-snapdragon-arm64-20171016-283.img
    platform-tools/fastboot flash rootfs db_image/linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283_martha.img

    platform-tools/fastboot reboot
}

if [ -z "$DEVICE_ID" ]
then
    echo "No Dragonboards found"
    echo "Are you in fastboot mode"
    echo "Power board on with vol - switch pressed"
else
    echo "Loading Project Martha onto board"
    flashall
fi



