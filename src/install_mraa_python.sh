export HOME=/home/linaro
cd $HOME
echo "Build mraa gpio library in:"
echo `pwd`
git clone https://github.com/intel-iot-devkit/mraa.git
cd mraa
mkdir build
cd build/
cmake -DBUILDSWIG=ON \
      -DBUILDSWIGPYTHON=ON \
      -DBUILDSWIGNODE=OFF \
      -DBUILDSWIGJAVA=OFF \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
make
sudo make install
