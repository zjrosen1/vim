echo "Well congrats on taking the big step into my .ViM config!"
echo ""
echo "If you want to keep your .vimrc then back that shit up!"
echo ""
echo "I'm about to override anything you have in thurr"
echo ""
echo "Cool?"

ln -sf ~/.vim/vimrc ~/.vimrc
cd ~/.vim
 git submodule update --init

