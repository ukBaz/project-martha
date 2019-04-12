echo `whoami`
export HOME=/home/linaro
cd /opt/theia-martha
echo "Build thia-martha in:"
echo `pwd`
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
echo "yarn"
yarn
echo "yarn build"
yarn theia build

