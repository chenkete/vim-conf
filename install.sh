#!/bin/bash

set -e

print_and_exit() {
	echo "$*"
	exit 1
}

OS=`uname`
if [ $OS != "Linux" ]; then
	print_and_exit "cannot execute install in non-linux enironment"
fi

VIM_CONF_DIR=$HOME/.vim
VIMRC=$HOME/.vimrc

echo "clone Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git $VIM_CONF_DIR/bundle/Vundle.vim

echo "copy .vimrc"
cp vimrc $VIMRC
 
echo "install plugin"
vim -c "PluginInstall" -c "qa!"


