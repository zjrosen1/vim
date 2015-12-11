# Installing on your own machine

    git clone git@github.com:castle-dev/vimrc.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule update --init --recursive

To enable JavaScript autocomplete:
- Build [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#full-installation-guide) after installing dependencies
- Install tern_for_vim npm dependencies with `cd ~/.vim/bundle/tern_for_vim/ && npm install`

To enable global searches:
- Install [the_silver-searcher](https://github.com/ggreer/the_silver_searcher)

## Installing plugins as git submodules

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

## Upgrading all bundled plugins

    git submodule foreach git pull origin master

## Keyboard shortcuts

The leader key is set to `,` and several commands have been remapped to avoid conflict with browser shortcuts. This allows us to develop from chromebook. :]

    Shortcut | Action
    --- | ---
    `,``n``t` | open file browser (NERDTree)
    `,``b``e` | browse open buffers
    `ctrl` + `p` | fuzzy match file paths in current directory
    `,``,` | refresh cache for fuzzy match
    `enter` | multi-cursor current word (repeat to select more occurences)
    `ctrl` + `c` | exit mutli-cursor (after `ctrl` + `m`)
    `,``w``s` | split window horizontally
    `,``w``v` | split window vertically
    `,``w``m` | more of current window
    `,``w``l` | less of current window
    `,``w``o` | close all windows but the current one
    `ctrl` + `j` | move the cursor down one window
    `ctrl` + `k` | move the cursor up one window
    `ctrl` + `h` | move the cursor left one window
    `ctrl` + `l` | move the cursor right one window
    `,``p` | toggle paste mode
    `,``c` | toggle copy mode
    `,``u` | toggle undo window
    `,``g``s` | run fugitive's interactive git status
    `,``g``a` | interactively stage changes since last commit (git add -p)
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
    `,``r``s` | focus current it in jasmine unit tests
    `,``r``b` | focus current describe in jasmine unit tests
    `,``t``t` | toggle angular test
    `z``m` | fold all code in active window (using indentation)
    `z``o` | open highlighted code fold
    `z``c` | close highlighted code block (using indentation)

## Configuring tmux to play nicely with vim

Paste [this tmux config](https://gist.github.com/lowe0292/af5748926a52948709eb) into your ~/.tmux.conf and the window navigation shortcuts from vim will work accross tmux panes too!
