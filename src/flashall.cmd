:: Script to install Project Martha on to Dragonboard from Windows host.
:: Ensure Dragonboard is in "fastboot" mode. To put board in this mode:
:: Power on with "Vol -" switch held

@ECHO OFF
for /f %%i in ('platform-tools\fastboot devices') do set devices=%%i
IF [%devices%] == [] GOTO MissingDevice
echo Flashing: %devices%

platform-tools\fastboot flash partition db_image\gpt_both0.bin
platform-tools\fastboot flash hyp db_image\hyp.mbn
platform-tools\fastboot flash rpm db_image\rpm.mbn
platform-tools\fastboot flash sbl1 db_image\sbl1.mbn
platform-tools\fastboot flash tz db_image\tz.mbn
platform-tools\fastboot flash aboot db_image\emmc_appsboot.mbn
platform-tools\fastboot flash cdt db_image\sbc_1.0_8016.bin
platform-tools\fastboot erase boot
platform-tools\fastboot erase rootfs
platform-tools\fastboot erase devinfo
platform-tools\fastboot reboot

ECHO Wait for reboot

platform-tools\fastboot flash boot db_image\boot-linaro-stretch-qcom-snapdragon-arm64-20171016-283.img
platform-tools\fastboot flash rootfs db_image\linaro-stretch-developer-qcom-snapdragon-arm64-20171016-283_martha.img
platform-tools\fastboot reboot

GOTO END

:MissingDevice
echo No Device in "fastboot" connected.
echo Power on Dragonboard while pressing "-" button.

:END
echo Exiting
PAUSE
