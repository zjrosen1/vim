"-------------------------
"	Author: Zack Rosen
"	Email: zjrosen@gmail.com
" Info: A solid vimrc
"-------------------------

" Pathogen for the win {{{1
" Plug-in Manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

" Prefrences {{{1
filetype plugin indent on
let mapleader =","								 " Set global mapleader
set nocompatible
set noswapfile
set autoindent
set smartindent
set hidden                          " Useful for auto setting hidden buffers
syntax enable                       " Enable syntax highlighting
set nostartofline                   " Don't reset cursor to start of line when moving around
set ttyfast

" Searching/Moving {{{2
" nnoremap / /\v
" vnoremap / /\v
set gdefault                        " Add the g flag to search/replace by default
set incsearch                       " Highlight dynamically as pattern is typed
" set hlsearch
set ignorecase											" Ignore case when searching
set smartcase												" Try and be smart about cases
nnoremap j gj
nnoremap k gk

" Appearance {{{2
set number                          " Always show line numbers
set listchars=tab:▸\ ,trail:·,eol:¬ " Use new symbols for tabstops and EOLs
set ts=2 sts=2 sw=2 expandtab     " Default tab stops
set list                            " Display whitespace"
set showcmd                         " Shows incomplete command
set novb noeb                       " Turn off visual bell and remove error beeps
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
set backspace=indent,eol,start

" Colors and Theme {{{2
set background=dark
colorscheme badwolf

" Auto Commands {{{1
" Auto source vimrc on save  {{{2
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

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

" Save on losing focus {{{2
au FocusLost * :wa
" Mappings {{{1
inoremap <C-c> <esc>								" Just smart
inoremap jj <ESC>										" Thank You Steve


command! W w												" Remap :W to :w

nnoremap Y y$												" Yank to end of line with Y

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Not sure about this one quite yet
" nnoremap ; :

nmap fq :q!<CR>
" Control space to search mode
nnoremap <Nul> /

" :Wrap to wrap lines command! -nargs=* Wrap set wrap linebreak nolist

" Toggle errors
nmap <leader>st :SyntasticToggleMode<cr>

" Remap split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Filetype {{{2
nmap _ht :set ft=html<CR>
nmap _ph :set ft=php<CR>
nmap _py :set ft=python<CR>
nmap _rb :set ft=ruby<CR>
nmap _js :set ft=javascript<CR>
nmap _zs :set ft=zsh<CR>
nmap _zs :set ft=mkd<CR>
nmap _vi :set ft=vim<CR>

" Folding {{{2
nnoremap <Space> za
" nnoremap <Space> /

" Bubble single lines {{{2
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

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

" Viewport Scrolling {{{2
nnoremap <C-e> 3<C-e>								" Speed up viewport scrolling
nnoremap <C-y> 3<C-y>

" Syntax highlighting groups for word under cursor {{{2
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Fucking F1 {{{2
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Leader Mappings {{{1
" Toggle Highlighting -- h {{{2
nmap <silent> <leader>h :set hlsearch!<CR>

" Update vimrc -- v OR ev {{{2
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Update snipmate -- sc {{{2
nmap <leader>sc :tabedit ~/.vim/bundle/vim-snippets/snippets<CR>

" Toggle Spell Checking -- s {{{2
nmap <silent> <leader>s :set spell!<CR>

" Ack -- a {{{2
nmap <Leader>a :Ack
" Tab Editing {{{2
" Useful mappings for managing taps
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Extras for now {{{2
nnoremap <leader>ft Vatzf

nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

nmap <Leader>" viwS"

nnoremap <leader>w <C-w>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>nt :NERDTreeToggle<cr>
" like gv but for pasted text
" nnoremap <leader>v V`]


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
" Easy-motion {{{2
" let g:EasyMotion_leader_key = '<Leader>'
" Emmet {{{2
let g:user_emmet_leader_key = '<c-e>'
"Fugitive Git {{{2
nmap <leader>ga :Git add -A<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>
" CoffeeScript {{{2
nnoremap <leader>cw :CoffeeWatch<cr>
nnoremap <leader>cr :CoffeeRun<cr>
" CtrlP {{{2
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 0 " Prefer windows to tabs
let g:ctrlp_max_files = 0 " Allow full caching of big projects
let g:ctrlp_max_depth = 40 " Allow full caching of deep files
let g:ctrlp_prompt_mappings = { 'AcceptSelection("v")': ['<cr>'], 'AcceptSelection("e")': [] }
" MultipleCursors {{{2
let g:multi_cursor_quit_key='<C-c>'
" Markdown {{{2
let g:vim_markdown_initial_foldlevel=1
" NerdTree {{{2
autocmd vimenter * if !argc() | NERDTree | endif " Load NERDTree by default for directory
" Powerline {{{2
let g:Powerline_symbols = 'fancy'
" Rainbow Parens {{{2
nmap <leader>r :RainbowParenthesesToggle<CR>
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" Syntastic {{{2
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
" Tabularize {{{2
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" Modelines {{{1
set modelines=1
" vim: set foldmethod=marker:
