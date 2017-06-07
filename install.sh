#!/bin/bash
echo "开始安装，请耐心等待~"

if which apt-get >/dev/null; then
    sudo apt install build-essential \
        python python3 python-dev python3-dev \
        ruby ruby-dev \
        lua5.3 liblua5.3-dev lua5.2 liblua5.2-dev \
        perl libperl-dev \
        libtcl8.6 \
        ncurses-dev \
        git cmake ctags silversearcher-ag curl
fi

if which brew >/dev/null;then
    echo "mac 使用brew安装~"
    brew install ruby ruby-dev perl libperl-dev cmake ctags git the_silver_searcher curl
fi

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --prefix=/usr \
    --with-features=huge \
    --enable-multibyte \
    --enable-cscope=yes \
    --enable-perlinterp=yes \
    --enable-rubyinterp=yes \
    --with-ruby-command=/usr/bin/ruby \
    --enable-luainterp=yes \
    --enable-pythoninterp=yes \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
    --enable-tclinterp=yes \
    --enable-gui=auto

make
sudo make install

mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old

echo "安装airline所需字体~"
cd ~
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "安装vim-plug插件~"
cd ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "开始安装vim环境~"
git clone https://github.com/wuzangsama/vim_ide.git
cp -f ~/vim_ide/.vimrc ~/

echo "开始安装Bundle插件，安装完将自动退出~"

vim -c "PlugInstall" -c "q" -c "q"

echo "开始安装YouCompleteMe~"

cd ~/.vim/bundle/YouCompleteMe/
./install.py --clang-completer

echo "最后一些处理工作~"
cd ~/.vim/bundle/ultisnips/
mkdir mysnippets
cd ~
cp -rf ~/vim_ide/mysnippets/* ~/.vim/bundle/ultisnips/mysnippets
#mkdir -p ~/.undo_history

echo "OK，祝使用愉快~"
