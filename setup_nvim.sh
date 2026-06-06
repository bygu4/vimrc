#! /bin/sh
set -e

echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set undofile
set undodir=~/.local/share/nvim/undo/' > ~/.config/nvim/init.vim

mkdir -p ~/.local/share/nvim/undo/

echo "Done!"
