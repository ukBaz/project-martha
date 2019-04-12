# Remember start location
start_cwd=$(pwd)

# Make directory
mkdir download_adb
cd download_adb

# Get three files
# Windows 
wget https://dl.google.com/android/repository/platform-tools-latest-windows.zip

# Linux 
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip

# macOS 
wget https://dl.google.com/android/repository/platform-tools-latest-darwin.zip
