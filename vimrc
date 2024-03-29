" indent
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set nu
set incsearch
set ignorecase
set hls


" plugin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'chenkete/vim-code-dark'

" Add plugins here

call vundle#end()
filetype plugin indent on

" @airline
set t_Co=256
let g:airline#extensions#tabline#enabled = 1   " 是否打开tabline
set laststatus=2  "永远显示状态栏
let g:airline_theme='bubblegum' "选择主题

" color scheme
colo codedark
