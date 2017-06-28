ENV GOPATH=$HOME/go
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
    && yum install -y golang \
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
    && yum install -y which \
    && cd /usr/local/src \
    && git clone https://github.com/vim/vim.git \
    && cd vim \
    && ./configure --prefix=/usr \
        --with-features=huge \
        --enable-multibyte \
        --enable-cscope=yes \
        --enable-luainterp=yes \
        --enable-pythoninterp=yes \
        --with-python-config-dir=/usr/lib64/python2.7/config/ \
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
    && cp -f .tmux.conf ~/ \
    && vim -c "PlugInstall" -c "q" -c "q" \
    && vim -c "GoInstallBinaries" -c "q" -c "q" \
    && cd ~/.vim/bundle/ultisnips/ \
    && mkdir mysnippets \
    && cp -rf /usr/local/src/vim_ide/mysnippets/* ~/.vim/bundle/ultisnips/mysnippets \
    && rm -rf /usr/local/src/vim_ide/ \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    && chsh -s /bin/zsh
    && yum clean all

