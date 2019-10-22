#!/bin/bash -e

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mv ~/.vimrc ~/.vimrc.backup
curl -LSso ~/.vimrc https://raw.githubusercontent.com/guilhermelimak/vim-setup/master/.vimrc

