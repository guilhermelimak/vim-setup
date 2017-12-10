#!/bin/bash -e

mv ~/.vimrc ~/.vimrc.backup
mv ~/.vim ~/.vim.backup

ln -s ~/vim-setup/.vim ~/.vim
ln -s ~/vim-setup/.vimrc ~/.vimrc
