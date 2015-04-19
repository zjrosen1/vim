clear
echo "Well congrats on taking the big step into my .ViM config!"
echo ""
echo "If you want to keep your .vimrc then back that shit up!"
echo ""
while true; do
	read -p "Do you want to continue y or n? " yn
	case $yn in
		[Yy]* ) 
			ln -sf ~/.vim/vimrc ~/.vimrc ;
			vim +PluginInstall +qall
			break;;
		[Nn]* ) echo "Bye";
			exit;;
		* ) echo "Please answer yes or no.";
			echo "";;
	esac
done
