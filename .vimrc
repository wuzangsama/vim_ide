"
" @file .vimrc
" @brief
" @author zhanghf@zailingtech.com
" @version 1.0
" @date 2017-05-11

"=========================================
" 基础>>
"=========================================

" 关闭兼容模式
set nocompatible

" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 启用鼠标
set mouse=a

" 退格键可用删除
set backspace=indent,eol,start

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number
set relativenumber

" 高亮显示当前行/列
set cursorline
"set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" 设置 gvim 显示字体
"set guifont=YaHei\ Consolas\ Hybrid\ 10.5

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase

" vim 自身命令行模式智能补全
set wildmenu

" 禁止折行
set nowrap

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 启动后定位到上次关闭光标位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags
"set tags+=/usr/include/sys.tags


"=========================================
" <<基础
"=========================================





"=========================================
" 插件安装>>
"=========================================

" vim-plug 环境设置
filetype off
" vim-plug 管理的插件列表必须位于 call plug#begin() 和 call plug#end() 之间
call plug#begin('~/.vim/bundle')

Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'
Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'raimondi/delimitmate'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/Mark--Karkat' "多个高亮 <leader>m
Plug 'Shougo/unite.vim'
Plug 'shougo/unite-outline'
Plug 'shougo/neomru.vim'
Plug 'shougo/vimfiler.vim'
Plug 'shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/unite-session'
Plug 'Shougo/unite-build'
Plug 'thinca/vim-unite-history'
Plug 'ujihisa/unite-colorscheme'
Plug 'tacroe/unite-mark'
Plug 'sgur/unite-qf'

" 插件列表结束
call plug#end()

"=========================================
" <<插件安装
"=========================================





"=========================================
" >>插件配置
"=========================================

">>>colorscheme
" 配色方案
"set background=dark
set t_Co=256

"colorscheme solarized
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
"let g:solarized_termcolors=256"

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

"colorscheme gruvbox
"<<<colorscheme


">>>airline
"let g:airline_theme="hybrid"
let g:airline_theme="molokai"
"let g:airline_theme="gruvbox"
"let g:airline_theme="solarized"
"let g:airline_theme="dark"

" 这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

" 显示buffer栏和buffer编号
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = '¶'
"<<<airline


">>>fswitch
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>A :FSHere<cr>
"<<<fswitch


">>>protodef
" 由接口快速生成实现框架
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
"<protodef


">>>ultisnips
let g:UltiSnipsSnippetDirectories=["mysnippets"] " snippets位置
let g:UltiSnipsExpandTrigger="<leader><tab>" " 防止和ycm冲突
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"<<<ultisnips


">>>tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
"<<<tabular


">>>Doxygen
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="zhanghf@zailingtech.com"
let g:DoxygenToolkit_versionString="1.0"
map <Leader>da <ESC>gg:DoxAuthor<CR>
map <Leader>df <ESC>:Dox<CR>
"<<<Doxygen


">>>syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"<<<syntastic


">>>ycm
" 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900"

" 不用每次提示加载.ycm_extra_conf.py文件
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" 关闭ycm的syntastic
let g:ycm_show_diagnostics_ui = 0

"let g:ycm_filetype_whitelist = {'c' : 1, 'cpp' : 1, 'java' : 1, 'python' : 1}
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1,
            \ 'mundo': 1,
            \ 'fzf': 1,
            \ 'ctrlp' : 1
            \}

" 评论中也应用补全
let g:ycm_complete_in_comments = 1

" 两个字开始补全
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>"
"<<<ycm


">>>vim-multiple-cursors
let g:multi_cursor_next_key='<S-M>' " 选中
let g:multi_cursor_skip_key='<S-K>' " 跳过
"<<<vim-multiple-cursors


">>>rainbow
let g:rainbow_active = 1
"<<<rainbow

">>>Unite
nnoremap <Space><Space> :Unite<cr>
nnoremap <Space>b :Unite buffer<cr>
nnoremap <Space>f :Unite file_rec<cr>i
nnoremap <Space>g :Unite grep<cr><cr>
nnoremap <Space>r :Unite file_mru<cr>
nnoremap <Space>o :Unite outline<cr>
nnoremap <Space>k :Unite mark<cr>
nnoremap <Space>hs :Unite history/search<cr>
nnoremap <Space>hc :Unite history/command<cr>
nnoremap <Space>hy :Unite history/yank<cr>
nnoremap <Space>mm :Unite build:make<cr>
nnoremap <Space>mc :Unite build:make:clean<cr>
nnoremap <Space>mi :Unite build:make:install<cr>
call unite#custom#source('codesearch', 'max_candidates', 30)
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_default_opts =
      \ '-iRHn'
      \ . " --exclude='tags'"
      \ . " --exclude='cscope*'"
      \ . " --exclude='*.svn*'"
      \ . " --exclude='*.log*'"
      \ . " --exclude='*tmp*'"
      \ . " --exclude-dir='**/tmp'"
      \ . " --exclude-dir='CVS'"
      \ . " --exclude-dir='.svn'"
      \ . " --exclude-dir='.git'"
      \ . " --exclude-dir='node_modules'"
if executable('hw')
  " Use hw (highway)
  " https://github.com/tkengo/highway
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
  " Use ag (the silver searcher)
  " https://github.com/ggreer/the_silver_searcher
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
  " Use pt (the platinum searcher)
  " https://github.com/monochromegane/the_platinum_searcher
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack
  " http://beyondgrep.com/
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
  " Use jvgrep
  " https://github.com/mattn/jvgrep
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
elseif executable('beagrep')
  " Use beagrep
  " https://github.com/baohaojun/beagrep
  let g:unite_source_grep_command = 'beagrep'
endif
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
"<<<Unite

">>>vimfiler
map <F3> :VimFilerExplorer<CR>
imap <F3> <ESC>:VimFilerExplorer<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = ''
let g:vimfiler_readonly_file_icon = '*'
let g:vimfiler_marked_file_icon = '√'
"let g:vimfiler_preview_action = 'auto_preview'
let g:vimfiler_ignore_pattern = [
      \ '^\.git$',
      \ '^\.DS_Store$',
      \ '^\.init\.vim-rplugin\~$',
      \ '^\.netrwhist$',
      \ '\.class$'
      \]
call vimfiler#custom#profile('default', 'context', {
      \ 'explorer' : 1,
      \ 'winwidth' : 30,
      \ 'winminwidth' : 30,
      \ 'toggle' : 1,
      \ 'auto_expand': 1,
      \ 'explorer_columns' : 30,
      \ 'parent': 0,
      \ 'status' : 1,
      \ 'safe' : 0,
      \ 'split' : 1,
      \ 'hidden': 1,
      \ 'no_quit' : 1,
      \ 'force_hide' : 0,
      \ })

"catch
"endtry
augroup vfinit
  au!
  autocmd FileType vimfiler call s:vimfilerinit()
  autocmd vimenter * if !argc() | VimFilerExplorer | endif " 无文件打开显示vimfiler
  autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'vimfiler') |
        \ q | endif
augroup END
function! s:vimfilerinit()
  setl nonumber
  setl norelativenumber
endf
"<<<vimfiler


"=========================================
" <<插件配置
"=========================================





"=========================================
" 快捷键>>
"=========================================

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap <C-w> <C-W>w
nnoremap <tab> <C-W>w
" 跳转至右方的窗口
"nnoremap <C-l> <C-W>l
" 跳转至方的窗口
"nnoremap <C-h> <C-W>h
" 跳转至上方的子窗口
"nnoremap <C-k> <C-W>k
" 跳转至下方的子窗口
"nnoremap <C-j> <C-W>j


" 库信息参考
" 启用;h命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义;h命令查看各类man信息的快捷键
nmap <Leader>h :Man 3 <cword><CR>

nmap <F4> :!ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ .<cr><cr>

"C，C++ 按F5编译运行
map <F7> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++11 -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    endif
endfunc

"C,C++的调试
map <F5> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -std=c++11 -g -o %<"
    exec "!gdb ./%<"
endfunc


" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>


" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()
" 全屏开/关快捷键
"map <silent> <F11> :call ToggleFullscreen()<CR>

"=========================================
" <<快捷键
"=========================================

