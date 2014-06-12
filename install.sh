#! /bin/bash

GITHUB_VIMRC_DIR=$(cd $(dirname "$0") && pwd)/vimrc

mkdir -p ~/.vim
cd ~/.vim

ls "$GITHUB_VIMRC_DIR" | while read file
do
    ln -s "$GITHUB_VIMRC_DIR/$file" .
done
