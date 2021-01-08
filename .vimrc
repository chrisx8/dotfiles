" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" general
set encoding=utf8
set number
set shiftwidth=4
set tabstop=4
syntax on

" search
set ignorecase
set incsearch
set smartcase
set hlsearch

" status line
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" regex
set magic
