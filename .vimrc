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
"set guifont=Noto\ Mono\ for\ Powerline:h12
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

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

Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
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
Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic'
" Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'justmao945/vim-clang'
Plug 'Shougo/neocomplete.vim'
Plug 'raimondi/delimitmate'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-commentary' " 注释 gcc gcu gcap
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region' " + 选中片段 - 不选中
Plug 'vim-scripts/Mark--Karkat' "多个高亮 <leader>m
Plug 'nvie/vim-togglemouse'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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

">>>colorscheme
" 配色方案
set background=dark
set t_Co=256

"colorscheme solarized
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
"let g:solarized_termcolors=256"

"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

colorscheme gruvbox
"<<<colorscheme


">>>airline
"let g:airline_theme="molokai"
let g:airline_theme="gruvbox"
"let g:airline_theme="solarized"
"let g:airline_theme="dark"

" 这个是安装字体后 必须设置此项"
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


">>>vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"<<<vim-easy-align


">>>Doxygen
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="zhanghf@zailingtech.com"
let g:DoxygenToolkit_versionString="1.0"
map <Leader>da <ESC>gg:DoxAuthor<CR>
map <Leader>df <ESC>:Dox<CR>
"<<<Doxygen


">>>ale
let g:ale_open_list=1
let g:ale_lint_on_text_changed='never'
"<<<ale

">>>syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"let g:syntastic_c_include_dirs = ['include', '../include', '../../inlclude', '../../../include']
"<<<syntastic


">>>ycm
" 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900"

" 不用每次提示加载.ycm_extra_conf.py文件
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" 关闭ycm的syntastic
" let g:ycm_show_diagnostics_ui = 0

"let g:ycm_filetype_whitelist = {'c' : 1, 'cpp' : 1, 'java' : 1, 'python' : 1}
" let g:ycm_filetype_blacklist = {
"             \ 'tagbar' : 1,
"             \ 'qf' : 1,
"             \ 'notes' : 1,
"             \ 'markdown' : 1,
"             \ 'unite' : 1,
"             \ 'text' : 1,
"             \ 'vimwiki' : 1,
"             \ 'pandoc' : 1,
"             \ 'infolog' : 1,
"             \ 'mail' : 1,
"             \ 'mundo': 1,
"             \ 'fzf': 1,
"             \ 'ctrlp' : 1
"             \}

" 评论中也应用补全
" let g:ycm_complete_in_comments = 1

" 两个字开始补全
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_semantic_triggers =  {'c' : ['->', '.'], 'objc' : ['->', '.'], 'ocaml' : ['.', '#'], 'cpp,objcpp' : ['->', '.', '::'], 'php' : ['->', '::'], 'cs,java,javascript,vim,coffee,python,scala,go' : ['.'], 'ruby' : ['.', '::']}
" nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>"
"<<<ycm


">>>vim-clang
let g:clang_cpp_options = '-std=c++11'
" disable auto completion for vim-clang
let g:clang_auto = 0
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt = 'menuone,preview'
let g:clang_cpp_completeopt = 'menuone,preview'

let g:clang_diagsopt = ''
"<<<vim-clang

">>>neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

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
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"<<<neocomplete


">>>vim-multiple-cursors
let g:multi_cursor_next_key='<S-M>' " 选中
let g:multi_cursor_skip_key='<S-K>' " 跳过
"<<<vim-multiple-cursors


">>>rainbow
let g:rainbow_active = 1
"<<<rainbow


">>>FZF
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
nnoremap <Space>b :Buffers<cr>
nnoremap <Space>f :Files<cr>
nnoremap <Space>g :Ag 
nnoremap <Space>t :BTags<cr>
nnoremap <Space>m :Marks<cr>
nnoremap <Space>hs :History/<cr>
nnoremap <Space>hc :History:<cr>
"<<<FZF


">>>Unite
nnoremap <Space><Space> :Unite<cr>
nnoremap <Space>r :Unite file_mru<cr>
nnoremap <Space>o :Unite outline<cr>
nnoremap <Space>hy :Unite history/yank<cr>
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
  "autocmd vimenter * if !argc() | VimFilerExplorer | endif " 无文件打开显示vimfiler
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
"<<<vimfiler


">>>smooth_scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"<<<smooth_scroll

">>>vim-go
"let g:go_echo_command_info = 0
"let g:go_echo_go_info = 0
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
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

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
"<<<vim-go




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
nnoremap <C-l> <C-W>l
" 跳转至方的窗口
nnoremap <C-h> <C-W>h
" 跳转至上方的子窗口
nnoremap <C-k> <C-W>k
" 跳转至下方的子窗口
nnoremap <C-j> <C-W>j


" 库信息参考
" 启用;h命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义;h命令查看各类man信息的快捷键
nmap <Leader>h :Man 3 <cword><CR>

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
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>


" 搜索选中项
function! VisualSelection(direction, extra_filter) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	execute 'Ag '.l:pattern

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

vnoremap <Space>g :call VisualSelection('ag', '')<CR>


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

