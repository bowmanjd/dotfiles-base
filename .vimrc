set nocompatible
set mouse=a
set hidden
set fileformat=unix
set fileformats=unix,dos
syntax enable
set number
set cursorline
set ai
set si
colorscheme torte
set background=dark
set nobackup
set nowrap
set clipboard=unnamed
set tabstop=2
set expandtab
set shiftwidth=2
set nohlsearch
set viminfo^=!
set encoding=utf-8

au BufNewFile,BufRead ssh_config,*/.ssh/config.d/*  setf sshconfig
au BufNewFile,BufRead *.md set spell spelllang=en_us ft=markdown formatoptions=l lbr wrap textwidth=0 wrapmargin=0 nolist
au BufNewFile,BufRead *.sql,*.csv set ignorecase smartcase

