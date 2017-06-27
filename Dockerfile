FROM centos
RUN yum update -y \
    && yum -y groupinstall "Development Tools" \
    && yum install -y clang \
    && yum install -y cscope \
    && yum install -y cmake \
    && yum install -y python \
    && yum install -y python-devel \
    && yum install -y ruby \
    && yum install -y ruby-devel \
    && yum install -y lua \
    && yum install -y lua-devel \
    && yum install -y perl \
    && yum install -y tcl \
    && yum install -y tcl-devel \
    && yum install -y ncurses \
    && yum install -y ncurses-devel \
    && yum install -y pcre-devel \
    && yum install -y xz-devel \
    && yum install -y epel-release.noarch \
    && yum install -y the_silver_searcher \
    && yum install -y zsh \
    && yum install -y tmux \
    && chsh -s $(which zsh) \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    && cd /usr/local/src \
    && git clone https://github.com/vim/vim.git \
    && cd vim \
    && ./configure --prefix=/usr \
        --with-features=huge \
        --enable-multibyte \
        --enable-cscope=yes \
        --enable-luainterp=yes \
        --enable-pythoninterp=yes \
        --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
        --enable-tclinterp=yes \
        --enable-gui=auto \
    && make \
    && make install \
    && cd .. \
    && rm -rf vim/ \
    && git clone https://github.com/powerline/fonts.git \
    && cd fonts \
    && ./install.sh \
    && cd .. \
    && rm -rf fonts/ \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox \
    && git clone https://github.com/Shougo/unite.vim.git ~/.vim/bundle/unite.vim \
    && git clone https://github.com/shougo/vimfiler.vim.git ~/.vim/bundle/vimfiler.vim \
    && git clone https://github.com/wuzangsama/vim_ide.git \
    && cd ./vim_ide \
    && git checkout with_vim_clang \
    && cp -f .vimrc ~/ \
    && cp -f .zshrc ~/ \
    && vim -c "PlugInstall" -c "q" -c "q" \
    && cd ~/.vim/bundle/ultisnips/ \
    && mkdir mysnippets \
    && cp -rf /usr/local/src/vim_ide/mysnippets/* ~/.vim/bundle/ultisnips/mysnippets \
    && rm -rf /usr/local/src/vim_ide/ \
    && yum clean all
