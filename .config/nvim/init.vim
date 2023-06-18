" basic stuff
set background=dark
set encoding=utf8
set nocompatible

" display
set cc=80
set showmatch
set number
set cursorline
set ttyfast
syntax on

" indentation
set autoindent
set expandtab
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

" completion
set spell
set omnifunc=ale#completion#OmniFunc
set wildmode=longest,list

" keyboard shortcuts
nnoremap <C-n> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <C-S-n> :tabNext<CR>

" enable clipboard
set clipboard+=unnamedplus

" plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'dense-analysis/ale'
	Plug 'itchyny/lightline.vim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'ryanoasis/vim-devicons'
	Plug 'vim-scripts/SearchComplete'
	Plug 'tpope/vim-fugitive'
	Plug 'w0ng/vim-hybrid'
call plug#end()

" plugin config
colorscheme hybrid
let g:airline_powerline_fonts=1
let g:ale_completion_enabled=1
