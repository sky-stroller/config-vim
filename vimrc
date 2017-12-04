set nocompatible

" Configure Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
if has('python') || has('python3')
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

" To have Vim load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set mouse=a

set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

set showcmd
set showmode
set showmatch
set matchtime=1

set hlsearch
set incsearch
set ignorecase

set ruler
set number
"set relativenumber
" vim 自身命令行模式智能补全
set wildmenu
" 总是显示状态栏
set laststatus=2

if !has('gui_running') && $TERM =~ '256'
    set t_Co=256
endif
set background=dark

set scrolloff=3
set backspace=indent,eol,start

" Set visible chars in list mode
set listchars=tab:>-,trail:@,eol:$
if has("patch-7.4.710")
    set listchars+=space:.  " 'space' item was added in patch 7.4.710
endif

set sessionoptions+=unix,slash

if &t_Co > 1 || has('gui_running')
   syntax enable
endif

" To have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
    au FileType * if &filetype =~ 'python' | setlocal textwidth=79 | endif
endif

set colorcolumn=+1  " set color for column after 'textwidth'

" 定义快捷键前缀，即 <Leader>
let mapleader="t"

" 窗口跳转快捷键(小写）
noremap twh <C-W>h
noremap twj <C-W>j
noremap twk  <C-W>k
noremap twl <C-W>l
ounmap twh
ounmap twj
ounmap twk
ounmap twl

" 窗口跳转快捷键(大写）
noremap TWH <C-W>h
noremap TWJ <C-W>j
noremap TWK  <C-W>k
noremap TWL <C-W>l
ounmap TWH
ounmap TWJ
ounmap TWK
ounmap TWL

" Maps for normal mode
nmap <S-A-UP> :move .-2<Enter>| "move line up
nmap <S-A-DOWN> :move .+1<Enter>| "move line down

" Config solarized colorscheme
if $TERM =~ '256'
    let g:solarized_termcolors=256
endif
let g:solarized_termtrans=1
colorscheme solarized

" Use clipboard register for all yank, delete change and put operations which
" would normally go to the unnamed register.
" if exists("&clipboard") && (&clipboard !~ "unnamed")
"     if has('unnamedplus')
"         let &clipboard = "unnamedplus" . (empty(&clipboard) ? "" : ",") . &clipboard
"     else
"         let &clipboard = "unnamed" . (empty(&clipboard) ? "" : ",") . &clipboard
"     endif
" endif

" 将文本复制到系统剪切板
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

" 将系统剪切板的内容粘贴至 vim
vnoremap <Leader>p "+p
nnoremap <Leader>p "+p

" Disable toolbar in gui mode
if has('gui_running')
    set guioptions-=T
endif

set cursorline " hightlight cursor line

"let g:Powerline_colorscheme='solarized'
let g:airline_powerline_fonts = 1

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
