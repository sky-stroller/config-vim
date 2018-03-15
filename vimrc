set nocompatible
setlocal foldmethod=marker

if has('win32')
    let vimrc_home = $HOME . '/vimfiles'
else
    let vimrc_home = $HOME . '/.vim'
endif

" Configure Vundle: make Vundle available {{{1
" ============================================================================
filetype off

let s:vundle_path = vimrc_home . '/bundle/Vundle.vim'
let &runtimepath = &runtimepath . ',' . s:vundle_path
call vundle#begin(vimrc_home . '/bundle')
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
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'rdnetto/YCM-Generator'

call vundle#end()


" General Setting: {{{1
" ============================================================================

" To have Vim load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

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
" Disable toolbar and scrollbars in gui mode
if has('gui_running')
    set guioptions-=T
    set guioptions-=R
    set guioptions-=r
    set guioptions-=L
    set guioptions-=l
endif

set cursorline " hightlight cursor line

" Set visible chars in list mode
set listchars=tab:>-,trail:@,eol:$
if has("patch-7.4.710")
    set listchars+=space:.  " 'space' item was added in patch 7.4.710
endif

set sessionoptions+=unix,slash
set colorcolumn=+1  " set color for column after 'textwidth'

if &t_Co > 1 || has('gui_running')
   syntax enable
endif

" Use clipboard register for all yank, delete change and put operations which
" would normally go to the unnamed register.
" if exists("&clipboard") && (&clipboard !~ "unnamed")
"     if has('unnamedplus')
"         let &clipboard = "unnamedplus" . (empty(&clipboard) ? "" : ",") . &clipboard
"     else
"         let &clipboard = "unnamed" . (empty(&clipboard) ? "" : ",") . &clipboard
"     endif
" endif

set splitbelow
set splitright


" Configure: Autocmd {{{1
" ============================================================================
" To have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
    au FileType * if &filetype =~ 'python' | setlocal textwidth=79 | endif
endif

" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC


" Configure: 全局快捷键: {{{1
" ============================================================================

" 定义快捷键前缀，即 <Leader>
let mapleader="t"

" Shorecuts: 窗口跳转 {{{2
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

" Shortcuts: 复制粘贴 {{{2
" Maps for normal mode
nmap <S-A-UP> :move .-2<Enter>| "move line up
nmap <S-A-DOWN> :move .+1<Enter>| "move line down

" 将文本复制到系统剪切板
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

" 将系统剪切板的内容粘贴至 vim
vnoremap <Leader>p "+p
nnoremap <Leader>p "+p


" Configure: 插件配置 {{{1
" ============================================================================

" Plugin: solarized colorscheme {{{2
"
if $TERM =~ '256'
    let g:solarized_termcolors=256
endif
let g:solarized_termtrans=1
colorscheme solarized

" Plugin: airline {{{2
"
" if has('gui_running')
"     let g:airline_powerline_fonts = 1
"     if has('win32')
"         let &guifont='Anonymice_Powerline:h9:cANSI:qDRAFT'
"     else
"         let &guifont = 'Anonymous Pro for Powerline 11'
"     endif
" endif
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>bh <Plug>AirlineSelectPrevTab
nmap <leader>bl <Plug>AirlineSelectNextTab

" Plugin: indent_guides {{{2
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 2

" Plugin: YCM {{{2
"
let g:ycm_always_populate_location_list = 1
let g:ycm_global_ycm_extra_conf = vimrc_home . '/.ycm_extra_conf.py'
nmap <leader>ji :YcmCompleter GoToInclude<CR>
nmap <leader>jc :YcmCompleter GoToDeclaration<CR>
nmap <leader>jd :YcmCompleter GoToDefinition<CR>
" find all of the references within the project to the identifier under the
" cursor for js, python and typescript.
nmap <leader>jr :YcmCompleter GoToRefrences<CR>
nmap <leader>st :YcmCompleter GetType<CR>| " show type
nmap <leader>sd :YcmCompleter GetDoc<CR>| " show doc
nmap <leader>fi :YcmCompleter FixIt<CR>| " fix it
