#!/bin/zsh

SCRIPT_DIR=${0:a:h}
echo "SCRIPT_DIR=$SCRIPT_DIR"

ln -s $SCRIPT_DIR/../Dotfiles/emacs/.emacs.d $HOME
ln -s $SCRIPT_DIR/../Dotfiles/vim/.vim $HOME
ln -s $SCRIPT_DIR/../Dotfiles/zsh/.zshrc $HOME
ln -s $SCRIPT_DIR/../Dotfiles/zsh/.zshenv $HOME
# ln -s $SCRIPT_DIR/../Dotfiles/git/.gitconfig $HOME
# ln -s $SCRIPT_DIR/../Dotfiles/git/.git_template $HOME
