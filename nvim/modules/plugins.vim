" Consult https://github.com/junegunn/vim-plug for more details
call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Autocompletion
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Aesthetics
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()

" Toggle commenting with: Control + / (or -)
map <C-_> :Commentary<CR>

" Aesthetics continued
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors

syntax enable
set background=dark
colorscheme gruvbox

" vim-go config

" Run :GoImports on file save
let g:go_fmt_command = "goimports"
