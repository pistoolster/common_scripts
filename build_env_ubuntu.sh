#!/bin/bash

# 检查管理员权限
if [ `whoami` != "root" ]; then
    echo "Superuser privileges are required to run this script."
    echo "e.g. \"sudo $0\""
    exit 1
fi

echo "墙内用户最好将软件源修改为国内镜像 3s后开始安装"
sleep 3
cd ~


echo "update源..."
# 更新源
sudo apt-get update


echo "安装基本软件..."
# 安装基本软件
sudo apt-get install -y vim tmux zsh curl git fonts-powerline docker python-dev python-pip mysql-server mysql-client libmysqlclient-dev redis

echo "安装必要字体..."
# fonts-powerline
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "安装SpaceVim..."
# SpaceVim
curl -sLf https://spacevim.org/cn/install.sh | bash

echo "安装pipenv..."
# pipenv
pip install pipenv

echo "安装on-my-zsh..."
# on-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "全部安装完成"
