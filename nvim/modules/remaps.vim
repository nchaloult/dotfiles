let mapleader = " "

" Golang
autocmd FileType go nmap <leader>b  <Plug>(go-build)

autocmd FileType tex nmap <leader>b :w <bar> exec '!make' <Enter>
