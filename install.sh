#! /bin/bash

GITHUB_ETC_DIR=$(cd $(dirname "$0") && pwd)/etc

GITHUB_VIMRC_DIR="$GITHUB_ETC_DIR/vimrc"
GITHUB_VIMPERATORRC="$GITHUB_ETC_DIR/vimperatorrc"
GITHUB_BASHRC="$GITHUB_ETC_DIR/bashrc"
GITHUB_HOSTS="$GITHUB_ETC_DIR/hosts"

if [ "$(uname -s)" = "Darwin" ]
then
    OS_TYPE="osx"
else
    OS_TYPE="linux"
fi

function make_symlink()
{
    local from=$1
    local to=$2

    [ -e "$from" ] || return 1

    if [ -e "$to" -o -L "$to" ]
    then
        mv -f "$to" "${to}.bak"
    fi

    ln -s "$from" "$to"
}

function install_vimrc()
{
    local user_vim_dir=~wolfwzr/.vim

    mkdir -p "$user_vim_dir"
    ls "$GITHUB_VIMRC_DIR" | while read file
    do
        make_symlink "$GITHUB_VIMRC_DIR/$file" "$user_vim_dir/$file"
    done
}

function install_bashrc()
{
    local target_file=/etc/wolfwzr.bashrc
    local system_bashrc=/etc/bash.bashrc

    [ "$OS_TYPE" = "osx" ] && system_bashrc=~/.bashrc

    make_symlink "$GITHUB_BASHRC" "$target_file"

    grep -v "^[ \t]*#" "$system_bashrc" | grep -s -q "source[ \t]\+$target_file"
    if [ $? -ne 0 ]
    then
        cp -f "$system_bashrc" "$system_bashrc.bak"
        echo "source $target_file" >> "$system_bashrc"
    fi
}

echo "install vimrc"
install_vimrc

echo "install bashrc"
install_bashrc

# install vimperatorrc
echo "install vimperatorrc"
make_symlink "$GITHUB_VIMPERATORRC" ~wolfwzr/.vimperatorrc

# install hosts
echo "install hosts"
make_symlink "$GITHUB_HOSTS" /etc/hosts
