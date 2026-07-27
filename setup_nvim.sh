#! /bin/sh
set -e

mkdir -p ~/.config/nvim
mkdir -p ~/.local/share/nvim/undo/

echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set undofile
set undodir=~/.local/share/nvim/undo/' > ~/.config/nvim/init.vim

echo "Done!"
