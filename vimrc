" Set global mapleader
let mapleader = ","

" Plug-in Manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>v :tabedit $MYVIMRC<CR>

" Enable syntax highlighting
syntax enable 
if has("autocmd")
	" Enable filetype detection
	filetype plugin indent on

	" Restore cursor position
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
endif
if &t_Co > 2 || has("gui_running")
	" Enable syntax highlighting
	syntax on
endif
   
" Highlight when searching | ,h to toggle
set hlsearch
nmap <silent> <leader>h :set hlsearch!<CR>

" Useful for auto setting hidden buffers
set hidden


" Load NERDTree by default for directory
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n><C-t> :NERDTreeToggle<CR>

" COLORS and Theme
set background=dark
colorscheme solarized 

" Always show line numbers
set nu

" :Wrap to wrap lines
command! -nargs=* Wrap set wrap linebreak nolist

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Indent Mapping
nmap <D-[> <<
nmap <D-]> <<
vmap <D-[> <gv
vmap <D-[> >gv

" Remove trailing white space
function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" Shortcut to rapidly toggle `set list` 
nmap <Leader>l :set list!<CR>
" Use new symbols for tabstops and EOLs 
set listchars=tab:▸\ ,eol:¬

" Default tab stops
set ts=4 sts=4 sw=4 noexpandtab

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
	call SummarizeTabs()
endfunction

function! SummarizeTabs()
	try
		echohl ModeMsg
		echon 'tabstop='.&l:ts
		echon ' shiftwidth='.&l:sw
		echon ' softtabstop='.&l:sts
		if &l:et
			echon ' expantab'
		else
			echon ' noexpandtab'
		endif
	finally
		echohl None
	endtry
endfunction
