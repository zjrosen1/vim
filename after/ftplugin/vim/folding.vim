function! VimFolds()
	return "0"
endfunction
setlocal foldmethod=expr
setlocal foldexpr=MarkdownFolds()
