" @file .vimrc
" @brief
" @author zhanghf@zailingtech.com
" @version 1.0
" @date 2017-07-29

"=========================================
" 基础>>
"=========================================

set nocompatible " 关闭兼容模式
let mapleader=';' " 定义快捷键的前缀，即 <leader>
set gcr=a:block-blinkon0 " 禁止光标闪烁
set mousemodel=popup_setpos " 右击鼠标跳出菜单
set backspace=indent,eol,start " 退格键可用删除

" 禁止显示滚动条和菜单、工具条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T

set laststatus=2 " 总是显示状态栏
set ruler " 显示光标当前位置

" 开启行号显示
set number
set relativenumber

" 高亮显示当前行/列
set cursorline
"set cursorcolumn

set hlsearch " 高亮显示搜索结果
set incsearch " 开启实时搜索功能
set ignorecase " 搜索时大小写不敏感
set wildmenu " vim 自身命令行模式智能补全
set nowrap " 禁止折行
set expandtab " 将制表符扩展为空格
set tabstop=4 " 设置编辑时制表符占用空格数
set shiftwidth=4 " 设置格式化时制表符占用空格数
set softtabstop=4 " 让 vim 把连续数量的空格视为一个制表符

" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldlevel=2
"set foldmethod=syntax
set nofoldenable " 启动 vim 时关闭折叠代码
set formatoptions+=m " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B " 合并两行中文时，不在中间加空格

set encoding=utf-8 " 设置新文件的编码为 UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 自动判断编码时，依次尝试以下编码：
set helplang=cn
set termencoding=utf-8 " 这句只影响普通模式 (非图形界面) 下的 Vim
set ffs=unix,dos,mac " Use Unix as the standard file type

syntax enable " 开启语法高亮功能
syntax on " 允许用指定语法高亮配色方案替换默认方案
filetype on " 开启文件类型侦测
filetype plugin on " 根据侦测到的不同类型加载对应的插件
filetype indent on " 自适应不同语言的智能缩进

set guifont=Source\ Code\ Pro\ for\ Powerline:h14 " 设置 gvim 显示字体

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " 启动后定位到上次关闭光标位置
    "autocmd BufWritePost $MYVIMRC source $MYVIMRC " 让配置变更立即生效
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

Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
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
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/DoxygenToolkit.vim'
" Plug 'w0rp/ale'
Plug 'vim-syntastic/syntastic'
Plug 'justmao945/vim-clang'
Plug 'Shougo/neocomplete.vim'
Plug 'raimondi/delimitmate'
Plug 'luochen1990/rainbow'
Plug 'tomtom/tcomment_vim' " 注释 gcc gcu gcap
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region' " + 选中片段 - 不选中
Plug 'vim-scripts/Mark--Karkat' "多个高亮 <leader>m
Plug 'nvie/vim-togglemouse'
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vinarise.vim'
Plug 'shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'shougo/unite-outline'
Plug 'shougo/neomru.vim'
Plug 'shougo/neoyank.vim'
Plug 'vim-scripts/vim-unite-cscope'
Plug 'terryma/vim-smooth-scroll'
Plug 'wuzangsama/vim-go', { 'do': ':GoInstallBinaries' }

" 插件列表结束
call plug#end()

"=========================================
" <<插件安装
"=========================================


"=========================================
" >>插件配置
"=========================================

" 配色方案
set t_Co=256

function! LoadAirline()
    " 这个是安装字体后 必须设置此项
    let g:airline_powerline_fonts = 1
    " 显示buffer栏和buffer编号
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1

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
endfunction

function! LoadColorSchemeSolarized()
    set background=dark
    colorscheme solarized
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    let g:solarized_termcolors=256"

    let g:airline_theme="solarized"
    call LoadAirline()
endfunction

function! LoadColorSchemeMolokai()
    set background=dark
    colorscheme molokai
    let g:molokai_original = 1
    let g:rehash256 = 1

    let g:airline_theme="molokai"
    call LoadAirline()
endfunction

function! LoadColorSchemeGruvbox()
    set background=dark
    colorscheme gruvbox

    let g:airline_theme="gruvbox"
    call LoadAirline()
endfunction
execute LoadColorSchemeMolokai()

" *.cpp 和 *.h 间切换
function! LoadFswitch()
    nmap <silent> <leader>a :FSHere<cr>
endfunction
execute LoadFswitch()

" 由接口快速生成实现框架
function! LoadProtodef()
    " 设置 pullproto.pl 脚本路径
    let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
    " 成员函数的实现顺序与声明顺序一致
    let g:disable_protodef_sorting=1
endfunction
execute LoadProtodef()

function! LoadUltisnips()
    let g:UltiSnipsSnippetDirectories=["mysnippets"] " snippets位置
    let g:UltiSnipsExpandTrigger="<leader><tab>" " 防止和ycm冲突
    let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
    let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
endfunction
execute LoadUltisnips()

function! LoadEasyAlign()
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
endfunction
execute LoadEasyAlign()

function! LoadDoxygen()
    let g:DoxygenToolkit_authorName="zhanghf@zailingtech.com"
    let g:DoxygenToolkit_versionString="1.0"
    map <leader>da <ESC>gg:DoxAuthor<CR>
    map <leader>df <ESC>:Dox<CR>
endfunction
execute LoadDoxygen()

function! LoadAle()
    let g:ale_open_list=1
    let g:ale_set_quickfix=1
    let g:ale_lint_on_text_changed='never'
endfunction

function! LoadSyntastic()
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_cpp_checkers = ['clang_check','clang_tidy','gcc']
    let g:syntastic_c_checkers = ['clang_check','clang_tidy','gcc']
    let g:syntastic_clang_check_config_file = '.clang'
    let g:syntastic_c_config_file = '.clang'
    let g:syntastic_clang_tidy_config_file = '.clang'
endfunction
execute LoadSyntastic()

function! LoadVimClang()
    let g:clang_cpp_options = '-std=c++11'
    let g:clang_auto = 0 " disable auto completion for vim-clang
    let g:clang_c_completeopt = 'menuone,preview' " default 'longest' can not work with neocomplete
    let g:clang_cpp_completeopt = 'menuone,preview'
    let g:clang_diagsopt = ''
endfunction
execute LoadVimClang()

function! LoadNeoComplete()
    let g:neocomplete#enable_at_startup = 1 " Use neocomplete.
    let g:neocomplete#enable_smart_case = 1 " Use smartcase.
    let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    "inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
endfunction
execute LoadNeoComplete()

function! LoadMultipleCursors()
    let g:multi_cursor_next_key='<S-M>' " 选中
    let g:multi_cursor_skip_key='<S-K>' " 跳过
endfunction
execute LoadMultipleCursors()

function! LoadRainbow()
    let g:rainbow_active = 1
endfunction
execute LoadRainbow()

function! LoadCommandT()
    set wildignore+=*.o,*.obj,.git,.svn,*.pyc,*.so,Library*
    let g:CommandTWildIgnore=&wildignore
    let g:CommandTMaxHeight = 30
    let g:CommandTMaxFiles = 500000
    let g:CommandTInputDebounce = 200
    let g:CommandTFileScanner = 'watchman'
    let g:CommandTMaxCachedDirectories = 10

    nnoremap <silent> <Space>f :CommandT<CR>
    nnoremap <silent> <Space>t :CommandTBuffer<CR>
    nnoremap <silent> <Space>j :CommandTJump<CR>
endfunction
execute LoadCommandT()

function! LoadUnite()
    nnoremap <Space><Space> :Unite<cr>
    nnoremap <Space>b :Unite buffer<cr>
    nnoremap <Space>g :Unite grep<cr><cr>
    nnoremap <Space>r :Unite file_mru<cr>
    nnoremap <Space>o :Unite outline<cr>
    nnoremap <Space>hy :Unite history/yank<cr>
    nnoremap <Space>hu :Unite history/unite<cr>
    nnoremap <Space>ci :Unite cscope/functions_calling<cr>
    nnoremap <Space>cb :Unite cscope/functions_called_by<cr>
    nnoremap <Space>cf :Unite cscope/find_this_symbol<cr>
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

    " Use ag (the silver searcher)
    " https://github.com/ggreer/the_silver_searcher
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''

    let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endfunction
execute LoadUnite()

function! LoadVimFiler()
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

        silent! nunmap <buffer> <C-l>
        silent! nunmap <buffer> <C-j>
        silent! nunmap <buffer> B

        nmap <buffer> i       <Plug>(vimfiler_switch_to_history_directory)
        nmap <buffer> <C-r>   <Plug>(vimfiler_redraw_screen)
        nmap <buffer> u       <Plug>(vimfiler_smart_h)
    endf
endfunction
execute LoadVimFiler()

function! LoadSmoothScroll()
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
endfunction
execute LoadSmoothScroll()

function! LoadVimGo()
    let g:go_fmt_command = "goimports"
    let g:go_autodetect_gopath = 1
    let g:go_list_type = "quickfix"

    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_generate_tags = 1

    " Open :GoDeclsDir with ctrl-g
    nmap <C-g> :GoDeclsDir<cr>
    imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

    augroup go
        autocmd!

        " Show by default 4 spaces for a tab
        autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

        " :GoBuild and :GoTestCompile
        autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

        " :GoTest
        autocmd FileType go nmap <leader>t  <Plug>(go-test)

        " :GoRun
        autocmd FileType go nmap <leader>r  <Plug>(go-run)

        " :GoDoc
        autocmd FileType go nmap <leader>d <Plug>(go-doc)

        " :GoCoverageToggle
        autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

        " :GoInfo
        autocmd FileType go nmap <leader>i <Plug>(go-info)

        " :GoMetaLinter
        autocmd FileType go nmap <leader>l <Plug>(go-metalinter)

        " :GoDef but opens in a vertical split
        autocmd FileType go nmap <leader>v <Plug>(go-def-vertical)
        " :GoDef but opens in a horizontal split
        autocmd FileType go nmap <leader>s <Plug>(go-def-split)

        " :GoAlternate  commands :A, :AV, :AS and :AT
        autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
        autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
        autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
        autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
    augroup END

    " build_go_files is a custom function that builds or compiles the test file.
    " It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
    function! s:build_go_files()
        let l:file = expand('%')
        if l:file =~# '^\f\+_test\.go$'
            call go#cmd#Test(0, 1)
        elseif l:file =~# '^\f\+\.go$'
            call go#cmd#Build(0)
        endif
    endfunction
endfunction
execute LoadVimGo()

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
nmap <leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap <C-w> <C-w>w
nnoremap <tab> <C-w>w
" 跳转至右方的窗口
nnoremap <C-l> <C-w>l
" 跳转至方的窗口
nnoremap <C-h> <C-w>h
" 跳转至上方的子窗口
nnoremap <C-k> <C-w>k
" 跳转至下方的子窗口
nnoremap <C-j> <C-w>j

" 库信息参考
source $VIMRUNTIME/ftplugin/man.vim
" 定义;h命令查看各类man信息的快捷键
nmap <leader>h :Man 3 <cword><CR>

" cd到buffer所在目录
noremap <leader>cd :cd %:p:h<cr>

if has("cscope")
    set csprg=/usr/bin/cscope              "指定用来执行 cscope 的命令
    set csto=1                             "先搜索tags标签文件，再搜索cscope数据库
    set cst                                "使用|:cstag|(:cs find g)，而不是缺省的:tag
    set nocsverb                           "不显示添加数据库是否成功
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out                   "添加cscope数据库
    endif
    set csverb                             "显示添加成功与否
endif

nmap <F4> :call GeneratorTags()<cr><cr><cr><cr>
func! GeneratorTags()
    exec "!ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ ."
    exec "!find . -name \"*.c\" -o -name \"*.cpp\" -o -name \"*.h\" -o -name \"*.hpp\" > cscope.files"
    exec "!cscope -q -R -b -i cscope.files"
endfunc

"C，C++ 按F7编译运行
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
nnoremap <leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
" fun! ToggleFullscreen()
" 	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
" endf
" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()
" 全屏开/关快捷键
"map <silent> <F11> :call ToggleFullscreen()<CR>

"=========================================
" <<快捷键
"=========================================
