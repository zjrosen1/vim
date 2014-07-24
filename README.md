# Installing on your own machine

    cd ~
    git clone http://github.com/zjrosen1/vim.git ~/.vim
		cd .vim
		./install.sh

## Installing plugins as git submodules

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

## Upgrading all bundled plugins
    git submodule foreach git pull origin master
