"##########################
"#                        #
"#   My WIP .vimrc        #
"#   Author: Zack Rosen   #
"#   Updated: 8/16/13     #
"#                        #
"##########################

"HEAD {{{1

" Plug-in Manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

let mapleader =","								 " Set global mapleader

" Prefrences {{{1
set nocompatible
set noswapfile
set autoindent
filetype indent on
syntax enable                       " Enable syntax highlighting
set hidden                          " Useful for auto setting hidden buffers
set gdefault                        " Add the g flag to search/replace by default
set incsearch                       " Highlight dynamically as pattern is typed
set ignorecase											" Ignore case when searching
set smartcase												" Try and be smart about cases
set nostartofline                   " Don't reset cursor to start of line when moving around
command W w													" Remap :W to :w
let g:user_emmet_leader_key = '<c-e>'
nnoremap <C-e> 3<C-e>								" Speed up viewport scrolling
nnoremap <C-y> 3<C-y>

" Appearance {{{2
set number                          " Always show line numbers
set listchars=tab:▸\ ,trail:·,eol:¬ " Use new symbols for tabstops and EOLs
set ts=2 sts=2 sw=2 noexpandtab     " Default tab stops
set showcmd                         " Shows incomplete command
set novb noeb                       " Turn off visual bell and remove error beeps
set nosol                           " Prevent cursor from jumping to start of line
set splitbelow										  " New window goes below
set splitright										  " New windows goes right
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*
set wildmenu                        " Enhance command-line completion
set wildmode=longest:full,full
set encoding=utf-8
set cursorline                      " Highlight current line
set laststatus=2                    " Always show the statusline
set t_Co=256                        " Explicitly tell Vim that the terminal supports 256 colors

autocmd vimenter * if !argc() | NERDTree | endif " Load NERDTree by default for directory
map <C-n><C-t> :NERDTreeToggle<CR>

" Colors and Theme {{{2
set background=dark
colorscheme badwolf 

"Git {{{1
nmap <leader>ga :Git add .<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

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
" Tab Editing {{{2
" Useful mappings for managing taps
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Folding {{{2
nnoremap <Space> za
" Highlighting  ,h {{{2
nmap <silent> <leader>h :set hlsearch!<CR>

" Update vimrc ,v {{{2
nmap <leader>v :tabedit $MYVIMRC<CR>

" Update snippets {{{2
command! -nargs=* Snips call Snips()
function! Snips()
	execute	:tabedit $MYVIMRC<CR>
endfunction
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

" Extras for now {{{2
nmap <Leader>l :set list!<CR>		" Shortcut to rapidly toggle `set list` 
nmap <Leader>" viwS"
nnoremap Y y$										" Yank to end of line with Y

autocmd FileType scss inoremap { {<cr>}<C-o>O
autocmd FileType scss inoremap : : ;<esc>i
autocmd FileType scss inoremap : : ;<esc>i

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

" Prune the arglist for matches
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
"	  Building a hash ensures we get each buffer only once
		let buffer_numbers = { }
		for quickfix_item in getqflist()
			let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
		endfor
		return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
	endfunction

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
" Plugins {{{1
" CtrlP {{{2
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 1 " <CR> = New Tab
" Tabularize {{{2
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif
