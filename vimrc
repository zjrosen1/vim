"-------------------------
" Authors: Zack Rosen, Scott Lowe
" Email: zjrosen@gmail.com, me@scottdlowe.com
" Info: A chromebook-friendly vimrc
"-------------------------

" Pathogen for the win
" Plug-in Manager
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

" Prefrences
filetype plugin indent on
let mapleader =","                 " Set global mapleader
set nocompatible
set noswapfile
set autoindent
set smartindent
set hidden                          " Useful for auto setting hidden buffers
syntax enable                       " Enable syntax highlighting
set nostartofline                   " Don't reset cursor to start of line when moving around
set ttyfast
set completeopt-=preview

" Searching/Moving
" nnoremap / /\v
" vnoremap / /\v
set gdefault                        " Add the g flag to search/replace by default
set incsearch                       " Highlight dynamically as pattern is typed
" set hlsearch
set ignorecase                      " Ignore case when searching
set smartcase                       " Try and be smart about cases
nnoremap j gj
nnoremap k gk

" Appearance
set number                          " Always show line numbers
set listchars=tab:▸\ ,trail:·,eol:¬ " Use new symbols for tabstops and EOLs
set ts=2 sts=2 sw=2 expandtab     " Default tab stops
set list                            " Display whitespace"
set showcmd                         " Shows incomplete command
set novb noeb                       " Turn off visual bell and remove error beeps
set splitbelow                      " New window goes below
set splitright                      " New windows goes right
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/ckeditor/*
set wildmenu                        " Enhance command-line completion
set wildmode=longest:full,full
set encoding=utf-8
set cursorline                      " Highlight current line
set laststatus=2                    " Always show the statusline
set t_Co=256                        " Explicitly tell Vim that the terminal supports 256 colors
set backspace=indent,eol,start

" Colors and Theme
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" Auto Commands
" Auto source vimrc on save 
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Restore cursor position
if has("autocmd")
  filetype plugin indent on
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  syntax on     " Enable syntax highlighting
endif

" Save on losing focus
au FocusLost * :wa
" Mappings
map ; :
nmap zr zR
nmap zm zM


command! W w                        " Remap :W to :w

nnoremap Y y$                       " Yank to end of line with Y

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
nnoremap <C-\> <C-w><C-p>
" Filetype
nmap _ht :set ft=html<CR>
nmap _ph :set ft=php<CR>
nmap _py :set ft=python<CR>
nmap _rb :set ft=ruby<CR>
nmap _js :set ft=javascript<CR>
nmap _zs :set ft=zsh<CR>
nmap _zs :set ft=mkd<CR>
nmap _vi :set ft=vim<CR>


" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Window Switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-\> <C-w><C-p>

" Indent Mapping
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-[> >gv

" Viewport Scrolling
nnoremap <C-e> 3<C-e>               " Speed up viewport scrolling
nnoremap <C-y> 3<C-y>

" Syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Fucking F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Leader Mappings
" Toggle Highlighting -- h
nmap <silent> <leader>h :set hlsearch!<CR>

" Update vimrc -- v OR ev
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Update snipmate -- sc
nmap <leader>sc :tabedit ~/.vim/bundle/vim-snippets/snippets<CR>

" Toggle Spell Checking -- s
nmap <silent> <leader>s :set spell!<CR>

" Tab Editing
" Useful mappings for managing tabs
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Extras for now
nnoremap <leader>ft Vatzf

nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

nmap <Leader>" viwS"
map <leader>p "*p
map <leader>y "*y
nmap <leader>0 "a
nmap <leader>1 "b
nmap <leader>2 "c
nmap <leader>3 "d
nmap <leader>4 "e
nmap <leader>5 "f
nmap <leader>6 "g
nmap <leader>7 "h
nmap <leader>8 "i
nmap <leader>9 "j

" Windows
" set winheight=15
" set winminheight=3
nnoremap <leader>w <C-w>
nnoremap <silent> <leader>wm :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>wl :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>wo :mksession! ~/.session.vim<CR>:wincmd o<CR>
nnoremap <leader>wu :source ~/.session.vim<CR>
nnoremap <Leader>nt :NERDTreeToggle<cr>
" like gv but for pasted text
" nnoremap <leader>v V`]


" Functions
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

" Prune the arglist for matches
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
"   Building a hash ensures we get each buffer only once
    let buffer_numbers = { }
    for quickfix_item in getqflist()
      let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
  endfunction

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

" Plugins
" Gundo
nnoremap <leader>u :GundoToggle<CR>
" Emmet
let g:user_emmet_leader_key = '<c-e>'
"Fugitive Git
nmap <leader>ga :Git add .<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gr :Git rebase -i 
nmap <leader>gp :Git push<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gt :Git tree<CR>

" CtrlP
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 0 " Prefer windows to tabs
let g:ctrlp_max_files = 0 " Allow full caching of big projects
let g:ctrlp_max_depth = 40 " Allow full caching of deep files
let g:ctrlp_reuse_window = 'nofile'
nmap <leader><leader> :CtrlPClearCache<CR>
" MultipleCursors
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_quit_key='<C-c>'
" Markdown
let g:vim_markdown_initial_foldlevel=1
" NerdTree
" autocmd vimenter * if !argc() | NERDTree | endif " Load NERDTree by default for directory
" Rainbow Parens
nmap <leader>r :RainbowParenthesesToggle<CR>
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" Syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map={ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html', 'ts'] }
" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" vim-angular
let g:angular_source_directory = 'app/scripts'
let g:angular_test_directory = 'test/spec'
" vim-airline
let g:airline_theme='badwolf'
" Modelines
set modelines=1
set foldmethod=indent
" Play nice with tmux
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif
" Quickfix shortcuts
nmap <leader>fa :Ag
nmap <leader>fn :cn<cr>
nmap <leader>fp :cp<cr>
nmap <leader>ff :cnf<cr>
nmap <leader>fl :copen<cr>
" Disable folding
set foldlevel=99
" Angular test conventions
nmap <leader>tt :A<cr>
nmap <leader>ti ,rs
nmap <leader>td ,rb
let g:angular_source_directory = 'client/src'
let g:angular_test_directory = 'client/test/unit'
" Startup screen
fun! Start()
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif
    enew
    setlocal
        \ nolist
        \ nonumber
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ noswapfile
        \ norelativenumber
    call append('$', '               `-//-`               ')
    call append('$', '            .:+oooooo+:.            ')
    call append('$', '        `-/+oooooo+ooooo+/-`        ')
    call append('$', '     .:+ooooooo:.``.:+oooooo+:.     ')
    call append('$', '  `/+oooooo+ooo      +oo++ooooo+/`  ')
    call append('$', '  -oooo+:.`:oo/      /oo/`.:+oooo-  ')
    call append('$', '  -oooo-   --`        `.-   .oooo-  ')
    call append('$', '  -oooo-                    .oooo-  ')
    call append('$', '  -oooo-                    .oooo-  ')
    call append('$', '  -oooo-       `-//-`       .oooo-  ')
    call append('$', '  -oooo-    .:/oooooo+:.    .oooo-  ')
    call append('$', '  -oooo- `:+oooooooooooo+:` .oooo-  ')
    call append('$', '  -oooo+:.`.:/oooooooo+:.`.:+oooo-  ')
    call append('$', '  `/+ooooo+/-``-/++/-``-/+oooooo/`  ')
    call append('$', '     .:+oooooo+:.``.:/oooooo+:.     ')
    call append('$', '        `-/oooooo++oooooo/-`        ')
    call append('$', '            .:+oooooo+:.`           ')
    call append('$', '               `-//-.               ')
    " setlocal nomodifiable nomodified
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

" Run after "doing all the startup stuff"
autocmd VimEnter * call Start()
" typescript commands
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
nmap <leader>tsd :TsuquyomiDefinition<CR>
nmap <leader>tsr :TsuquyomiReferences<CR>
nmap <leader>tsc :!tsc<CR>
