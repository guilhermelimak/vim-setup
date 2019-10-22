#!/bin/bash -e

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mv ~/.vimrc ~/.vimrc.backup

ln -s ~/vim-setup/.vimrc ~/.vimrc
