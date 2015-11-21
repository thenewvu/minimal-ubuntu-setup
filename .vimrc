set noswapfile
set hlsearch
set laststatus=2
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2

" automatically set syntax *.md files to markdown
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
