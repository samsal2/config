#!/bin/zsh

SCRIPT_DIR=${0:a:h}
# echo "SCRIPT_DIR=$SCRIPT_DIR"

# ln -s $SCRIPT_DIR/../dotfiles/emacs/.emacs.d $HOME
ln -s $SCRIPT_DIR/../dotfiles/vim/.vim $HOME
ln -s $SCRIPT_DIR/../dotfiles/zsh/.zshrc $HOME
ln -s $SCRIPT_DIR/../dotfiles/zsh/.zshenv $HOME
# ln -s $SCRIPT_DIR/../Dotfiles/git/.gitconfig $HOME
# ln -s $SCRIPT_DIR/../Dotfiles/git/.git_template $HOME
# ln -s $SCRIPT_DIR/../Dotfiles/hyper/.hyper.js $HOME
