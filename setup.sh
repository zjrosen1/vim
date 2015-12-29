#!/bin/bash
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
WHITE='\033[0;37m'
YELLOW='\033[1;33m'

echo -e "${PURPLE}Installing .vimrc...${YELLOW}"
ln -s ~/.vim/vimrc ~/.vimrc

if [ "$?" -ne "0" ]; then
  echo -e "${PURPLE}~/.vimrc already exists, removing..."
  rm ~/.vimrc
  ln -s ~/.vim/vimrc ~/.vimrc
fi

echo -e "${PURPLE}Installing submodules...${WHITE}"
cd ~/.vim
git submodule update --init --recursive > /dev/null

echo -e "${PURPLE}Installing tern_for_vim npm dependencies...${WHITE}"
cd ~/.vim/bundle/tern_for_vim/
npm install > /dev/null

echo -e "${YELLOW}TODO: Install silver searcher: https://github.com/ggreer/the_silver_searcher#installing"

echo -e "${YELLOW}TODO: Build YCM: https://github.com/Valloric/YouCompleteMe#installation"

echo -e "${CYAN}Success!"
