#!/bin/bash

set -e

SCRIPT_NAME=$0
NOVUNDLE=0

usage() {
cat << EOF
usage: $SCRIPT_NAME [-novundle]
	-novundle: no git operation on vundle(for faster test)
EOF
	exit 1
}

while [ -n "$1" ]; do
	case "$1" in
		-novundle)
			NOVUNDLE=1;;
		--help | -h)
			usage;;
		*)
			echo "invalid arg: $1"
			usage
	esac
	shift
done

print_and_exit() {
	echo "$*"
	exit 1
}

my_log() {
	printf "\033[32m%s\033[0m\n" "$*"
}

OS=`uname`
if [ $OS != "Linux" ]; then
	print_and_exit "cannot execute install in non-linux enironment"
fi

VIM_CONF_DIR=$HOME/.vim
VIMRC=$HOME/.vimrc

if [ $NOVUNDLE -eq 0 ]; then
	VUNDLE=$VIM_CONF_DIR/bundle/Vundle.vim
	if [ -d $VUNDLE ]; then
		my_log "$VUNDLE exists, git pull"
		$SHELL -c "cd $VUNDLE && git pull"
	else
		my_log "clone Vundle"
		git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE
	fi
fi

my_log "copy .vimrc"
cp vimrc $VIMRC
 
my_log "install plugin"
vim -c "PluginInstall" -c "qa!"


