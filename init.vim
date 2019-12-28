" ------------------[ Neovim configs ]------------------

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Consult https://github.com/junegunn/vim-plug for more details
call plug#begin('~/.local/share/nvim/plugged')

" Autocompletion
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'

  Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1
  Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }

" Syntax
  Plug 'pangloss/vim-javascript'

" Utilities
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'w0rp/ale'

" Aesthetics
" Plug 'altercation/vim-colors-solarized'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Launch NERDTree with: Control + n
map <C-n> :NERDTreeToggle<CR>

" Toggle commenting of lines with: Control + / (or -)
map <C-_> :Commentary<CR>

" Aesthetics
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors

" ------------------[ Normal vim configs ]------------------

" Basics
filetype plugin on
set encoding=utf-8
set linebreak
set nocompatible
set number
set relativenumber
set scrolloff=2
set wrap
set ruler
set showmatch

syntax enable
set background=dark
colorscheme gruvbox

set tabstop=2 shiftwidth=2 expandtab smarttab autoindent

" When in a particular file type, set tab stops to 4
autocmd FileType markdown set sw=4 ts=4
autocmd FileType py set sw=4 ts=4
autocmd FileType java set sw=4 ts=4
autocmd FileType go set sw=4 ts=4
" C configs in accordance with the linux kernel style guide.
" https://kernelnewbies.org/FirstKernelPatch
autocmd FileType c set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

" Navigation with guides
inoremap <c-j> <Esc>/<++><Enter>"_c4l
vnoremap <c-j> <Esc>/<++><Enter>"_c4l
map <c-j> <Esc>/<++><Enter>"_c4l
