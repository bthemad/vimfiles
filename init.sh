#!/bin/sh

# Install NeoBundle
BUNDLE_DIR=~/.vim/bundle
INSTALL_DIR=$BUNDLE_DIR/neobundle.vim

if [ -e $INSTALL_DIR ]; then
   rm -rf $INSTALL_DIR
fi

mkdir -p $BUNDLE_DIR
git clone https://github.com/Shougo/neobundle.vim $INSTALL_DIR
echo "NeoBundle setup complete."

# Create temp and backup
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup
echo "Temp directory created."

# Link .vimrc
[[ -f ~/.vimrc ]] && rm ~/.vimrc
ln -s ~/.vim/.vimrc ~/.vimrc
echo ".vimrc symlink created"
