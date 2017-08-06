#!/bin/bash

#Tmux configuration
echo "Creating backups of any current tmux configurations..."
cp ~/.tmux.conf ~/.tmux.conf.OLD
cp ~/.tmux.conf.local ~/.tmux.conf.local.OLD

echo "Installing my tmux configuration..."
cp ../tmux/tmux.conf ~/.tmux.conf
cp ../tmux/tmux.conf.local ~/.tmux.conf.local

#Patched font
echo "Creating ~/.fonts directory if it does not exist..."
mkdir ~/.fonts

echo "Copying over patched font to be used with terminal..."
cp ../URXvt/Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ Mono.otf ~/.fonts/

#Xdefaults
echo "Creating backup of ~/.Xdefaults..."
cp ~/.Xdefaults ~/.Xdefaults.OLD

echo "Installing my Xdefault configuration..."
cp ../URXvt/Xdefaults ~/.Xdefaults

echo "Make sure this git repo is saved inside '~/git/dotfiles/' or else URXvt plugins will not work properly!"
