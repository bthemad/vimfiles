#!/bin/sh

# Install NeoBundle
INSTALL_DIR=~/.vim/dein

if [ -e $INSTALL_DIR ]; then
   rm -rf $INSTALL_DIR
fi

mkdir -p $BUNDLE_DIR
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.vim/installer.sh
echo "Installing dein"
sh ~/.vim/installer.sh $INSTALL_DIR
rm -rf ~/.vim/installer.sh

# Create temp and backup
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup
echo "Temp directory created."

# Link .vimrc
[[ -f ~/.vimrc ]] && rm ~/.vimrc
ln -s ~/.vim/.vimrc ~/.vimrc
echo ".vimrc symlink created"
