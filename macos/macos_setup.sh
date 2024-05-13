#!/bin/zsh

SCRIPT_DIR=${0:a:h}
# echo "SCRIPT_DIR=$SCRIPT_DIR"

ln -s $SCRIPT_DIR/../dotfiles/.vim $HOME
ln -s $SCRIPT_DIR/../dotfiles/.config $HOME
ln -s $SCRIPT_DIR/../dotfiles/.zshrc $HOME
ln -s $SCRIPT_DIR/../dotfiles/.zshenv $HOME
