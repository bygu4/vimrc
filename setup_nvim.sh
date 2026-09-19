#! /bin/sh
set -e

mkdir -p ~/.config/nvim
mkdir -p ~/.vim_runtime/temp_dirs/undodir_nvim

echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc' > ~/.config/nvim/init.vim

echo "Done!"
