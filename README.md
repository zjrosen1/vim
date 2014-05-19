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
    `j``j` | exit insert mode
    `,``n``t` | open file browser (NERDTree)
    `ctrl` + `p` | fuzzy match file paths in current directory (files open in current window by default)
    `,``,``w` | easy motion forward by word
    `,``,``b` | easy motion backward by word
    `,``,``j` | easy motion down by line
    `,``,``k` | easy motion up by line
    `,``w``s` | split window horizontally
    `,``w``v` | split window vertically
    `,``w``j` | move the cursor down one window
    `,``w``k` | move the cursor up one window
    `,``w``h` | move the cursor left one window
    `,``w``l` | move the cursor right one window
