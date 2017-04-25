# Install on your own machine

    git clone git@github.com:castle-dev/.vimrc ~/.vim
    cd ~/.vim
    ./setup.sh

## Add new plugins as git submodules

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

## Upgrade existing plugins

    git submodule foreach git pull origin master

## Keyboard shortcuts

The leader key is set to `,` and several commands have been remapped to avoid conflict with browser shortcuts. This allows us to develop from chromebook. :]

    Shortcut | Action
    --- | ---
    `,``n``t` | open file browser (NERDTree)
    `,``b``e` | browse open buffers
    `ctrl` + `p` | fuzzy match file paths in current directory
    `,``,` | refresh cache for fuzzy match
    `ctrl` + `n` | multi-cursor current word (repeat to select more occurences)
    `ctrl` + `c` | exit mutli-cursor (after `ctrl` + `n`)
    `,``w``s` | split window horizontally
    `,``w``v` | split window vertically
    `,``w``m` | more of current window
    `,``w``l` | less of current window
    `,``w``o` | close all windows but the current one
    `ctrl` + `j` | move the cursor down one window
    `ctrl` + `k` | move the cursor up one window
    `ctrl` + `h` | move the cursor left one window
    `ctrl` + `l` | move the cursor right one window
    `,``p` | paste from system clipboard
    `,``y` | copy selection to system clipboard
    `,``d` | cut selection to system clipboard
    `,``g``s` | run fugitive's interactive git status
    `,``g``a` | add unstaged changes (git add .)
    `,``g``c` | commit staged changes (git commit)
    `,``g``r` | interactively rebase off develop (git rebase -i develop)
    `,``g``d` | compare changes in current file to last commit (git diff)
    `,``g``p` | push current branch to upstream remote (git push)
    `,``g``l` | view recent commits on the current branch (git log)
    `,``g``t` | view recent commits on all branches (git [tree](http://stackoverflow.com/questions/1057564/pretty-git-branch-graphs))
    `,``f``a` | global search accross all files in current project
    `,``f``l` | list search results
    `,``f``n` | advance to next search result
    `,``f``p` | return to previous search result
    `,``f``f` | advance to first search result in next file
    `,``s``p` | toggle spell check
    `,``s``n` | edit snippets for current filetype
    `,``t``t` | toggle angular test file
    `,``t``d` | toggle focus of angular test suite
    `,``t``i` | toggle focus angular test
    `,``t``s``d` | go to definition (typesript only)
    `,``t``s``b` | jump back from definition (typesript only)
    `,``t``s``i` | import highlighted symbol (experimental, typescript only)
    `,``t``s``r` | list references (typesript only)
    `,``t``s``c` | change name (typesript only)
    `,``u` | toggle undo window
    `z``m` | fold all code in active window (using indentation)
    `z``r` | open all code in active window
    `z``c` | close highlighted code block (using indentation)
    `z``o` | open highlighted code fold

## Configuring tmux to play nicely with vim

Install [Castle's tmux config](https://github.com/castle-dev/.tmux.conf#installing-on-mac-or-linux).
