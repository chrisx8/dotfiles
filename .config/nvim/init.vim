set encoding=utf8
set nocompatible
set showmatch
set number
set cursorline
set ttyfast
syntax on

" indentation
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
filetype plugin indent on

" mouse
set mouse=v
set mouse=a

" search
set ignorecase
set incsearch
set smartcase
set hlsearch

" regex
set magic

" enable clipboard
set clipboard+=unnamedplus

" plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
	Plug 'scrooloose/nerdtree'
	Plug 'bling/vim-airline'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
call plug#end()

" plugin config
let g:airline_powerline_fonts=1
