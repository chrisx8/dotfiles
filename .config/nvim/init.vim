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
	Plug 'airblade/vim-gitgutter'
	Plug 'dense-analysis/ale'
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'vim-scripts/SearchComplete'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'tpope/vim-fugitive'
call plug#end()

" plugin config
let g:airline_powerline_fonts=1
