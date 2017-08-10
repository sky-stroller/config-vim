set nocompatible

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

if $TERM =~ '256'
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

if &t_Co > 1
   syntax enable
endif

" To have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" To have Vim load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

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
if exists("&clipboard") && (&clipboard !~ "unnamed")
    if has('unnamedplus')
        let &clipboard = "unnamedplus" . (empty(&clipboard) ? "" : ",") . &clipboard
    else
        let &clipboard = "unnamed" . (empty(&clipboard) ? "" : ",") . &clipboard
    endif
endif
