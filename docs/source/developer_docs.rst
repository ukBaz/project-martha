=============================
Image Developer Documentation
=============================

Download Recipes
----------------

.. py:attribute:: download_adb.sh

    This downloads the ADB/Fastboot tools.
    Used by packaging recipe to make installing the image on the Dragonboard f
    rom different platforms possible


.. py:attribute:: download_linux.sh

    Download the files needs for the build_linux recipe.


.. py:attribute:: build_dt_update.sh

    Clone the github repository of Device Tree utility scripts


Build `rootfs` Recipes
----------------------

.. py:attribute:: build_linux.sh

    .. note:: Can only be run on Linux host

    This recipe does the creation of the Linux rootfs for the 410c. It does this updating the
    rootfs image provided by Linaro. The major steps are:

    - Resize original image
    - Install Theia IDE
    - Setup theia-ide to autostart
    - Install mraa library
    - Update Debian packages
    - Install latest Python pip



Packaging Recipes
-----------------

The files loaded on the Dragonboard are the same for all packages. They are packaged
separately because the utility to load them onto the Dragonboard are platform specific.

.. py:attribute:: build_martha_package_linux.sh

    Create zip file for Linux.

.. py:attribute:: build_martha_package_macos.sh

    Create zip file for MacOS.

.. py:attribute:: build_martha_package_windows.sh

    Create zip file for Windows.


Legacy
------

.. py:attribute:: build_theia.sh

    Script to cross-compile Theia IDE on host machine. This is not required as this
    is now down as part of the build_linux recipe.

.. py:attribute:: build_mraa.sh

    *Currently not documented.*
