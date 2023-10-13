" Basics

filetype plugin on
set colorcolumn=72,80,88
set encoding=utf-8
set linebreak
set number
set relativenumber
set ruler
set scrolloff=2
set showmatch
set hlsearch
set tabstop=4 shiftwidth=4 expandtab

" File-specific

autocmd FileType css set tabstop=2 shiftwidth=2
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2
autocmd FileType json set tabstop=4 shiftwidth=4
autocmd FileType markdown set spell
autocmd FileType typescript set tabstop=2 shiftwidth=2
autocmd FileType yaml set tabstop=4 shiftwidth=4

function! PackInit() abort
  packadd minpac

  call minpac#init()

  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('jiangmiao/auto-pairs')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-surround')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('junegunn/fzf')

  call minpac#add('morhetz/gruvbox')
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

nnoremap <C-p> :<C-u>FZF<CR>

" gruvbox
" Makes sure colors are properly displaying compared to how iTerm2 renders
" them
colorscheme gruvbox
set termguicolors

" vim-commentary
" Toggle commenting with Control + / (or -)
nmap <C-_> :Commentary<CR>

" vim-easy-align config (https://github.com/junegunn/vim-easy-align#quick-start-guide)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
