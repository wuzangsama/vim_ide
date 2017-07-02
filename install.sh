#!/bin/bash
echo "开始安装，请耐心等待~"

echo "安装依赖~"
if which apt-get >/dev/null; then
    sudo apt install build-essential \
        python python3 python-dev python3-dev \
        ruby ruby-dev \
        lua5.3 liblua5.3-dev lua5.2 liblua5.2-dev \
        perl libperl-dev \
        libtcl8.6 \
        ncurses-dev \
        git cmake ctags silversearcher-ag curl cscope
fi

if which yum >/dev/null; then
    sudo yum install python
    sudo yum install python3
    sudo yum install python-devel
    sudo yum install python3-devel
    sudo yum install ruby
    sudo yum install ruby-devel
    sudo yum install lua
    sudo yum install lua-devel
    sudo yum install perl
    sudo yum install tcl
    sudo yum install tcl-devel
    sudo yum install ncurses
    sudo yum install ncurses-libs
    sudo yum install ncurses-c++-libs
    sudo yum install ncurses-compat-libs
    sudo yum install ncurses-devel
    sudo yum install git
    sudo yum install cmake
    sudo yum install ctags
    sudo yum install curl
    sudo yum install cscope
    sudo yum install ncurses-term

    sudo yum install -y pcre-devel
    sudo yum install xz-devel
    sudo yum install automake
    cd /usr/local/src
    sudo git clone https://github.com/ggreer/the_silver_searcher.git
    cd the_silver_searcher
    sudo ./build.sh
    sudo make install
fi

if which brew >/dev/null;then
    echo "mac 使用brew安装~"
    brew install ruby ruby-dev perl libperl-dev cmake ctags git the_silver_searcher curl cscope
fi


echo "重新编译安装vim~"
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --prefix=/usr \
    --with-features=huge \
    --enable-multibyte \
    --enable-cscope=yes \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-rubyinterp=yes \
    --enable-pythoninterp=yes \
    --with-python-config-dir=/usr/lib64/python2.7/config/ \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib64/python3.4/config/ \
    --enable-tclinterp=yes \
    --enable-gui=auto

make
sudo make install


echo "安装airline所需字体~"
cd ~
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts


echo "备份原来的vim配置~"
mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old


echo "安装vim-plug插件~"
cd ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


echo "开始安装vim环境~"
git clone https://github.com/wuzangsama/vim_ide.git
cp -f ~/vim_ide/.vimrc ~/


echo "开始安装Bundle插件，安装完将自动退出~"
vim -c "PlugInstall" -c "q" -c "q"


echo "最后一些处理工作~"
cd ~/.vim/bundle/ultisnips/
mkdir mysnippets
cd ~
cp -rf ~/vim_ide/mysnippets/* ~/.vim/bundle/ultisnips/mysnippets


echo "OK，祝使用愉快~"
