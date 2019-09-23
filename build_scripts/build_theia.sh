# Remember where we started
start_cwd=$(pwd)

# Make directory
mkdir theia-martha
cd theia-martha
# Copy in package information
# cp ../src/theia_package.json package.json
cp ../src/theia_min_package.json package.json

# Install nvm and yarn
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
nvm install 8
npm install -g yarn

# Install dependencies
sudo apt-get install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
sudo apt-get install build-essential autoconf libtool cmake pkg-config git python3-dev swig3.0 libpcre3-dev libnode-dev
pip3 install python-language-server
pip3 install jedi


# Build Matha IDE
yarn
yarn theia build
export CC=/usr/bin/aarch64-linux-gnu-gcc
export CXX=/usr/bin/aarch64-linux-gnu-g++
echo ${CC}
yarn theia rebuild --target_arch=aarch64
unset CC CXX

# Bundle-up for install on  Dragonboard
cd ..
tar -zcf ${start_cwd}/theia-martha.tar.Z theia-martha/
pushd ~
tar -zcf ${start_cwd}/yarn_install.tar.Z .nvm .config .npm
popd

