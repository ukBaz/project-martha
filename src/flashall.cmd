:: Script to install Project Martha on to Dragonboard from Windows host.
:: Ensure Dragonboard is in "fastboot" mode. To put board in this mode:
:: Power on with "Vol -" switch held

fastboot flash partition db_image/gpt_both0.bin
fastboot flash hyp db_image/hyp.mbn
fastboot flash rpm db_image/rpm.mbn
fastboot flash sbl1 db_image/sbl1.mbn
fastboot flash tz db_image/tz.mbn
fastboot flash aboot db_image/emmc_appsboot.mbn
fastboot flash cdt db_image/sbc_1.0_8016.bin

fastboot erase boot
fastboot erase rootfs
fastboot erase devinfo

fastboot reboot

fastboot flash boot db_image/boot-linaro-stretch-qcom-snapdragon-arm64-20171016-283.img
fastboot flash rootfs db_image/linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283_martha.img

