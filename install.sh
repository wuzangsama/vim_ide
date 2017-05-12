#!/bin/bash
echo "开始安装，请耐心等待~"

if which apt-get >/dev/null; then
    sudo apt install build-essential python-dev ncurses-dev git cmake ctags
fi

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-pythoninterp --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python-config-dir=/usr/lib/python2.7/config/ --enable-gui=gtk2 --enable-cscope --prefix=/usr
make
sudo make install

mv -f ~/.vim ~/.vim_old
mv -f ~/.vimrc ~/.vimrc_old

cd ~
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/wuzangsama/vim_ide.git
cp -f ~/vim_ide/.vimrc ~/

echo "开始安装Bundle插件，安装完将自动退出~"

vim -c "PluginInstall" -c "q" -c "q"

echo "开始安装YouCompleteMe~"

cd ~/.vim/bundle/YouCompleteMe/
./install.py --clang-completer

echo "最后一些处理工作~"
cd ~
cp -rf ~/vim_ide/mysnippets/ ~/.vim/bundle/ultisnips/
cp -f ~/vim_ide/.indexer_files ~/

echo "OK，祝使用愉快~"
