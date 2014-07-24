# Installing on your own machine

    cd ~
    git clone http://github.com/lowe0292/vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule update --init 

## Installing plugins as git submodules

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

## Upgrading all bundled plugins
    
    git submodule foreach git pull origin master

## Keyboard shortcuts

The leader key is set to `,` and several commands have been remapped to avoid conflict with browser shortcuts. This allows me develop from my chromebook. :]

    Shortcut | Action
    --- | ---
    `,``n``t` | open file browser (NERDTree)
    `ctrl` + `p` | fuzzy match file paths in current directory (files open in current window by default)
    `ctrl` + `m` | multi-cursor current word (repeat to select more occurences)
    `ctrl` + `c` | exit mutli-cursor (after `ctrl` + `m`)
    `,``,``w` | easy motion forward by word
    `,``,``b` | easy motion backward by word
    `,``,``j` | easy motion down by line
    `,``,``k` | easy motion up by line
    `,``w``s` | split window horizontally
    `,``w``v` | split window vertically
    `,``w``j` or `ctrl` + `j` | move the cursor down one window
    `,``w``k` or `ctrl` + `k` | move the cursor up one window
    `,``w``h` or `ctrl` + `h` | move the cursor left one window
    `,``w``l` or `ctrl` + `l` | move the cursor right one window
    `,``w``o` | close all windows but the current one
    `,``t``t` | open new tab
    `,``t``n` | open the next tab
    `,``t``p` | open the previous tab
    `,``t``f` | open the first tab
    `,``t``l` | open the last tab
    `,``t``o` | close all tabs but the current one
    `,``b``e` | browse open buffers
    `,``g``s` | run fugitive's interactive git status
    `,``g``a` | stage the changes in the current file (git add)
    `,``g``c` | restore current file to last commit (git checkout)
    `,``g``d` | compare changes in current file to last commit (git diff)
    `,``g``p` | push current branch to upstream remote (git push)
    `z``r` | restore all folded code in active window
    `z``m` | fold all code in active window (using indentation)
    `z``o` | open highlighted code fold
    `z``c` | close highlighted code block (using indentation)
