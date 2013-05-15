"HEAD {{{1
"##########################
"#                        #
"#   My WIP .vimrc        #
"#   Author: Zack Rosen   #
"#   Updated: 5/15/13     #
"#                        #
"##########################

" vim: setfoldmethod=marker

" Plug-in Manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

let mapleader = ","		" Set global mapleader

" Prefrences {{{1
set nocompatible
set noswapfile
filetype indent on
syntax enable			" Enable syntax highlighting
set hidden				" Useful for auto setting hidden buffers
set encoding=utf-8

autocmd vimenter * if !argc() | NERDTree | endif " Load NERDTree by default for directory
map <C-n><C-t> :NERDTreeToggle<CR>

"Appearance {{{2
set number                      " Always show line numbers
set listchars=tab:▸\ ,eol:¬     " Use new symbols for tabstops and EOLs
set ts=4 sts=4 sw=4 noexpandtab " Default tab stops

" Colors and Theme {{{2
set background=dark
colorscheme solarized 

"Git {{{1
nmap <leader>g :Git add .<CR>
nmap <leader>c :Gcommit<CR>
nmap <leader>p :Git push<CR>

" Auto Commands {{{1
" Auto source vimrc on save  {{{2
if has("autocmd")
	autocmd BufWritePost vimrc source $MYVIMRC
endif

" Restore cursor position {{{2
if has("autocmd")
	filetype plugin indent on
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
endif
if &t_Co > 2 || has("gui_running")
	syntax on			" Enable syntax highlighting
endif

" Mappings {{{1
" Highlighting  ,h {{{2
nmap <silent> <leader>h :set hlsearch!<CR>

" Update vimrc ,v {{{2
nmap <leader>v :tabedit $MYVIMRC<CR>
" Bubble single lines {{{2
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Window Switching {{{2
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Indent Mapping {{{2
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-[> >gv

" Spell Checking {{{2
nmap <silent> <leader>s :set spell!<CR> " Toggle spell checking on and off with `,s`

" Syntax highlighting groups for word under cursor {{{2
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Tabularize {{{2
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" Extras for now {{{2
nmap <Leader>l :set list!<CR>		" Shortcut to rapidly toggle `set list` 

" :Wrap to wrap lines
command! -nargs=* Wrap set wrap linebreak nolist

" Functions {{{1
" Remove trailing white space {{{2
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


" Set tabstop, softtabstop and shiftwidth to the same value {{{2
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
