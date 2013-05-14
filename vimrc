"##########################
"#                        #
"#   My WIP .vimrc        #
"#   Author: Zack Rosen   #
"#   Updated: 9/16/13     #
"#                        #
"##########################


" Plug-in Manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

let mapleader = ","		" Set global mapleader
set encoding=utf-8		" Set encoding
set nocompatible
set noswapfile
filetype indent on
set hidden				" Useful for auto setting hidden buffers
set nu					" Always show line numbers

"Git Commands
nmap <leader>g :Git add .<CR>
nmap <leader>c :Gcommit<CR>
nmap <leader>p :Git push<CR>
" Auto source vimrc on save & update vimrc on the fly with ,v
if has("autocmd")
	autocmd BufWritePost vimrc source $MYVIMRC
endif
nmap <leader>v :tabedit $MYVIMRC<CR>

syntax enable			" Enable syntax highlighting
if has("autocmd")
	filetype plugin indent on
						" Restore cursor position
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
endif
if &t_Co > 2 || has("gui_running")
	syntax on			" Enable syntax highlighting
endif
   
" set hlsearch			" Highlight when searching | ,h to toggle
nmap <silent> <leader>h :set hlsearch!<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Visually select the text that was last edited/pasted
nmap gV `[v`]

" WINDOWS
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Load NERDTree by default for directory
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n><C-t> :NERDTreeToggle<CR>

" COLORS and Theme
set background=dark
colorscheme solarized 
" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif



" :Wrap to wrap lines
command! -nargs=* Wrap set wrap linebreak nolist

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Indent Mapping
nmap <D-[> <<
nmap <D-]> >>
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

nmap <Leader>l :set list!<CR>		" Shortcut to rapidly toggle `set list` 
set listchars=tab:▸\ ,eol:¬			" Use new symbols for tabstops and EOLs 

set ts=4 sts=4 sw=4 noexpandtab		" Default tab stops

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
