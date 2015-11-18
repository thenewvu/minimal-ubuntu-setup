set noswapfile
set hlsearch
set laststatus=2
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" automatically set syntax *.md files to markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
