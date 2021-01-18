for module in split(globpath('~/.config/nvim/modules', '*.vim'), '\n')
	exe 'so ' . module
endfo
