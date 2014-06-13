#! /bin/bash

GITHUB_REPO_DIR=$(cd $(dirname "$0") && pwd)
GITHUB_VIMRC_DIR="$GITHUB_REPO_DIR/vimrc"

install_vimrc()
{
    mkdir -p ~/.vim
    cd ~/.vim
    
    ls "$GITHUB_VIMRC_DIR" | while read file
    do
        if [ -e "$file" ]
        then
            mv -fv "$file" "$file.bakup"
        fi
        ln -s "$GITHUB_VIMRC_DIR/$file" .
    done
}

install_vimrc
