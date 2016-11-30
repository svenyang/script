"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Author : viiv@163.com (http://www.codesbox.com)
" 
" KISS(Keep it Simple Stupid)
" DRY(Don't repeat yourself)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��Windows��һЩ���õ�����
"source $VIMRUNTIME/mswin.vim
set fileencodings=utf-8,ucs-bom,gbk,latin-1
set encoding=utf-8


" ���ð���vundle�ͳ�ʼ����ص�runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " ��һ��ѡ��, ָ��һ��vundle��װ�����·��
" "call vundle#begin('~/some/path/here')
"
" " ��vundle�������汾,����
Plugin 'VundleVim/Vundle.vim'

" " ���·�������֧�ֲ�ͬ��ʽ�Ĳ����װ.
" " �뽫��װ����������vundle#begin��vundle#end֮��.
" " Github�ϵĲ��
" " ��ʽΪ Plugin '�û���/����ֿ���'
Plugin 'tpope/vim-fugitive'
" " ���� http://vim-scripts.org/vim/scripts.html �Ĳ��
" " Plugin '�������' ʵ������ Plugin 'vim-scripts/����ֿ���'
" ֻ�Ǵ˴����û�������ʡ��
Plugin 'L9'
" " ��Git֧�ֵ�����github�ϵĲ���ֿ� Plugin 'git clone ����ĵ�ַ'
" Plugin 'git://git.wincent.com/command-t.git'
" " ���ص�Git�ֿ�(�����Լ��Ĳ��) Plugin 'file:///+���ز���ֿ����·��'
" Plugin 'file:///home/gmarik/path/to/plugin'
" " ����ڲֿ����Ŀ¼��.
" " ��ȷָ��·����������runtimepath. ���·��������sparkup/vimĿ¼��
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " ��װL9������Ѿ���װ�������������������¸�ʽ����������ͻ
" Plugin 'ascenator/L9', {'name': 'newL9'}
" go ���
Plugin 'fatih/vim-go'
" Ŀ¼���
Plugin 'scrooloose/nerdtree'
" taglist ���
Plugin 'vim-scripts/taglist.vim'
" �Զ���ȫ���
Plugin 'vim-scripts/AutoComplPop'
" ����.h/.cpp��ת���
Plugin 'vim-scripts/A.vim'


" " ������в����Ҫ����������֮ǰ
call vundle#end()            " ����
filetype plugin indent on    " ����
" ����vim�Դ��Ͳ����Ӧ���﷨���ļ�������ؽű�
" " ���Ӳ���ı�����,����ʹ���������:
filetype plugin on
" "
" " ��Ҫ�����ĵ�
" " :PluginList       - �г����������õĲ��
" " :PluginInstall    - ��װ���,׷�� `!` ���Ը��»�ʹ�� :PluginUpdate
" " :PluginSearch foo - ���� foo ; ׷�� `!` ������ػ���
" " :PluginClean      - ���δʹ�ò��,��Ҫȷ��; ׷�� `!`
" �Զ���׼�Ƴ�δʹ�ò��
" "
" " ���� :h vundle ��ȡ����ϸ�ں�wiki�Լ�FAQ
" " �����Լ��Էǲ��Ƭ�η�������֮��

"set termencoding=gbk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �������viģʽ
set nocompatible

" ���ü�������������
set history=100

" ��filetype���
filetype on
filetype plugin on
filetype indent on

" ���Զ���ȫ
set completeopt=longest,menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ������ʾ����
" set guifont=Fixed:h11:cDEFAULT

" �����к�
set number

" �����﷨����
syntax on

" ������ɫ����
"color evening
color darkblue

" �������������
 autocmd GUIEnter * simalt ~x

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ������������
set incsearch
set ignorecase smartcase
" ���ò��ҽ������
set hlsearch
" �����ı�λ����ʾ
set ruler
" ȥ��menu/toolbar/scroll
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=b
set guioptions-=L
" ����λ����ʾ
" set helplang=cn
" ����make����
" set makeprg=scons
" ������ʾ
set wildmenu
" ����˫����ģʽ
set lazyredraw
" ����ļ�û�б���,�л��������������ʾ
set hidden
" �����˸��
set backspace=eol,start,indent
" ��������ƥ��
set showmatch
" ���ܿ�����һ��
set autoindent
" ���������Զ�����
set smartindent
" ����C��������
set cindent
" ����һЩ�����Ĵ�С
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
" ��ݼ�
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���ü�ֵӳ��
" ��Ҫ����F1��ӳ����

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

" ����һ�´����л��Ŀ�ݷ�ʽ
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" �����ļ��л�
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

" Tlist ����
let Tlist_Auto_Open = 0
let Tlist_Compact_Format = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0

" ��Doxygen����
let g:load_doxygen_syntax=1

" ����gdb
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

