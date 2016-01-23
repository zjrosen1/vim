#!/bin/bash
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
WHITE='\033[0;37m'
YELLOW='\033[1;33m'
OS=$(uname)

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

echo -e "${PURPLE}Building YCM...${WHITE}"
if [ $OS = "Darwin" ]; then
  echo -e "Mac OS detected..."
  echo -e "${PURPLE}Installing cmake with brew...${WHITE}"
  brew install cmake
else
  echo -e "Linux OS detected..."
  echo -e "${PURPLE}Updating package list...${WHITE}"
  sudo apt-get update -y
  echo -e "${PURPLE}Installing build-essential with apt-get...${WHITE}"
  sudo apt-get install build-essential -y
  echo -e "${PURPLE}Installing cmake with apt-get...${WHITE}"
  sudo apt-get install cmake -y
  echo -e "${PURPLE}Installing python-dev with apt-get...${WHITE}"
  sudo apt-get install python-dev -y
fi
cd ~
mkdir .ycm_build
cd .ycm_build
echo -e "${PURPLE}Generating config files...${WHITE}"
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
echo -e "${PURPLE}Compiling libraries...${WHITE}"
cmake --build . --target ycm_support_libs

echo -e "${PURPLE}Installing silver searcher...${WHITE}"
if [ $OS = "Darwin" ]; then
  echo -e "Mac OS detected..."
  echo -e "${PURPLE}Installing silver searcher with brew...${WHITE}"
  brew install the_silver_searcher
else
  echo -e "Linux OS detected..."
  echo -e "${PURPLE}Installing silver searcher with apt-get...${WHITE}"
  sudo apt-get install silversearcher-ag -y
fi

echo -e "${PURPLE}Building vimproc.vim...${WHITE}"
cd ~/.vim/bundle/vimproc.vim/
make

echo -e "${CYAN}Success!${WHITE}"
cd ~
