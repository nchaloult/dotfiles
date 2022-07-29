" Consult https://github.com/junegunn/vim-plug for more details
call plug#begin('~/.local/share/nvim/plugged')

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Navigation
Plug 'kyazdani42/nvim-tree.lua'

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

" Navigation continued
" https://github.com/kyazdani42/nvim-tree.lua#setup
lua << EOF
require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
      },
    },
  },
})
EOF
" Toggle nvim-tree with: leader, then t
map <leader>t :NvimTreeToggle<CR>

" Aesthetics continued
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set termguicolors

syntax enable
set background=dark
colorscheme gruvbox

" vim-go config

" Run :GoImports on file save
let g:go_fmt_command = "goimports"
