# if the bundle folder doesn't exist, clone the github repo
if [ ! -d ~/.vim/bundle ]; then
	echo "About to clone the VundleVim GitHub repo..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "Done cloning the repo"
fi

# if the user doesn't have a .vimrc file yet in the home folder, then link the vimrc file from this repo to ~/.vimrc file
if [ ! -f ~/.vimrc ]; then
	echo "Creating a symbolic link to the vimrc file of this repo to ~/.vimrc"
	# get this script's absolute path
	SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	VIMRC_PATH=$SCRIPT_DIR"/vimrc"
	echo "VIMRC_PATH=$VIMRC_PATH"
	ln -s $VIMRC_PATH ~/.vimrc
fi

# install all the missing Vundle plugins
vim +PluginInstall +qall



