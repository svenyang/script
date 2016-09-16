"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Author : viiv@163.com (http://www.codesbox.com)
" 
" KISS(Keep it Simple Stupid)
" DRY(Don't repeat yourself)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开Windows的一些常用的设置
"source $VIMRUNTIME/mswin.vim
set fileencodings=utf-8,ucs-bom,gbk,latin-1
set encoding=utf-8


" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " 另一种选择, 指定一个vundle安装插件的路径
" "call vundle#begin('~/some/path/here')
"
" " 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" " 以下范例用来支持不同格式的插件安装.
" " 请将安装插的命令放在vundle#begin和vundle#end之间.
" " Github上的插件
" " 格式为 Plugin '用户名/插件仓库名'
Plugin 'tpope/vim-fugitive'
" " 来自 http://vim-scripts.org/vim/scripts.html 的插件
" " Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名'
" 只是此处的用户名可以省略
Plugin 'L9'
" " 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'
" " 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'
" " 插件在仓库的子目录中.
" " 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}
" go 插件
Plugin 'fatih/vim-go'
" 目录插件
Plugin 'scrooloose/nerdtree'
" taglist 插件
Plugin 'vim-scripts/taglist.vim'
" 自动补全插件
Plugin 'vim-scripts/AutoComplPop'
" 增加.h/.cpp跳转插件
Plugin 'vim-scripts/A.vim'


" " 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须
" 加载vim自带和插件相应的语法和文件类型相关脚本
" " 忽视插件改变缩进,可以使用以下替代:
filetype plugin on
" "
" " 简要帮助文档
" " :PluginList       - 列出所有已配置的插件
" " :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" " :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" " :PluginClean      - 清除未使用插件,需要确认; 追加 `!`
" 自动批准移除未使用插件
" "
" " 查阅 :h vundle 获取更多细节和wiki以及FAQ
" " 将你自己对非插件片段放在这行之后

"set termencoding=gbk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 无需兼容vi模式
set nocompatible

" 设置记忆命令行数量
set history=100

" 打开filetype插件
filetype on
filetype plugin on
filetype indent on

" 打开自动补全
set completeopt=longest,menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置显示字体
" set guifont=Fixed:h11:cDEFAULT

" 设置行号
set number

" 设置语法加亮
syntax on

" 设置颜色主题
"color evening
color darkblue

" 程序启动就最大化
 autocmd GUIEnter * simalt ~x

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置增量查找
set incsearch
set ignorecase smartcase
" 设置查找结果高亮
set hlsearch
" 设置文本位置显示
set ruler
" 去掉menu/toolbar/scroll
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=b
set guioptions-=L
" 设置位置提示
" set helplang=cn
" 设置make工具
" set makeprg=scons
" 设置提示
set wildmenu
" 设置双缓冲模式
set lazyredraw
" 如果文件没有保存,切换缓冲有讨厌的提示
set hidden
" 设置退格键
set backspace=eol,start,indent
" 设置括号匹配
set showmatch
" 智能开启下一行
set autoindent
" 设置智能自动缩进
set smartindent
" 设置C缩进规则
set cindent
" 设置一些缩进的大小
set tabstop=4
set shiftwidth=4
set softtabstop=4

set mouse=a
set so=7

"Nice statusbar
set laststatus=2
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding}, " encoding
set statusline+=%{&fileformat}] " file format
set statusline+=%= " right align
set statusline+=0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

if has("cscope")
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置键值映射
" 不要设置F1的映射了

map <F4> :clist<CR>
imap <F4> <Esc>:clist<CR>

map <F5> :cNext<CR>
imap <F5> <Esc>:cNext<CR>

map <F6> :NERDTreeToggle<CR>:TlistToggle<CR><C-w>l
imap <F6> <Esc>:NERDTreeToggle<CR>:TlistToggle<CR><C-w>l
" F7
map <F7>  :wa<CR>:make -j3 patch<CR>
imap <F7> <Esc>:wa<CR>:make -j3 patch<CR>
" Ctrl + F7
" Alt + F7
" Shift + F7

" F8
" Ctrl + F8
" Alt + F8
map <F10>  :wa<CR>:!svn up<CR>:!svn commit --message="fix bugs"<CR>
imap <F10> <Esc>:wa<CR>:!svn up<CR>:!svn commit --message="fix bugs"<CR>
" Shift + F8

" F9
" Ctrl + F9
map <F9> <Esc>:!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
" set tags+=C:/source/tags/stl.tags
" set tags+=C:/source/tags/company.tags
" set tags+=/data/dev/viivwang/vim7.2/v_tags/cpp 
" set tags+=/data/dev/viivwang/vim7.2/v_tags/boost
" set tags+=/data/dev/viivwang/vim7.2/v_tags/wbl
" Alt + F9
" Shift + F9

" F10
" Ctrl + F10
" Alt + F10
" Shift + F10

" F11
map <F11> <Esc>:Dox<CR>
imap <F11> :Dox<CR>
" Ctrl + F11
" map <C-F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
" Alt + F11
" Shift + F11

" F12
"map <F12> :set spell!<CR>
"imap <F12> <Esc>:set spell!<CR>
" Ctrl + F12
" Alt + F12
" Shift + F12
inoremap <F12> <Esc>:A<CR>
map <F12> <Esc>:A<CR>
nmap <F12> <Esc>:A<CR>
imap <F12> <Esc>:A<CR>

" 设置一下窗体切换的快捷方式
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" 设置文件切换
map <M-o> :A<CR>
imap <M-o> <Esc>:A<CR>

inoremap <M-/> <C-x><C-o>

nmap <M-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <M-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <M-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <M-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <M-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <M-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <M-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <M-d> :cs find d <C-R>=expand("<cword>")<CR><CR>

" Tlist 设置
let Tlist_Auto_Open = 0
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0

" 打开Doxygen高亮
let g:load_doxygen_syntax=1

" 设置gdb
"set previewheight=12
"source $VIMRUNTIME/macros/gdb_mappings.vim
"set asm=0
"set gdbprg=msp430-gdb
set splitbelow
set splitright

set foldmethod=syntax


let NERDTreeIgnore=['\.o$', '\~$','tags']

let g:BASH_AuthorName   = 'Junshan Wang' 
let g:BASH_AuthorRef    = 'zhaoyang21cn'
let g:BASH_Email        = 'zhaoyang21cn@gmail.com' 
let g:BASH_Company      = 'Tencent'
let g:BASH_Template_Directory =  $VIMRUNTIME . '/bash-support/templates/'
let g:BASH_CodeSnippets       =  $VIMRUNTIME . '/bash-support/codesnippets'
let g:BASH_Dictionary_File    =  $VIMRUNTIME . '/bash-support/wordlists/bash.list'

let g:sql_type_default='mysql'

"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
"
vnoremap ( s()<Esc>P
vnoremap [ s[]<Esc>P
vnoremap { s{}<Esc>P
"
"-------------------------------------------------------------------------------
" autocomplete quotes
"-------------------------------------------------------------------------------
vnoremap  '  s''<Esc>P<Right>
vnoremap  "  s""<Esc>P<Right>
vnoremap  `  s``<Esc>P<Right>
"
inoremap	'  '<Esc>:call QuoteInsertionWrapper("'")<CR>a
inoremap	"  "<Esc>:call QuoteInsertionWrapper('"')<CR>a
inoremap	`  `<Esc>:call QuoteInsertionWrapper('`')<CR>a
"
"-------------------------------------------------------------------------------
" Add a second quote only if the left and the right character are not keyword
" characters.
"-------------------------------------------------------------------------------
function! QuoteInsertionWrapper (quote)
	let	col	= col('.')
	if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
		normal ax
		exe "normal r".a:quote."h"
	end
endfunction    " ----------  end of function QuoteInsertionWrapper  ----------
"

" let g:vimwiki_list=[{'path':'/data/dev/viivwang/viiv_wiki'}]

