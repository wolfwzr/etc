#! /bin/bash

GITHUB_ETC_DIR=$(cd $(dirname "$0") && pwd)/etc

GITHUB_VIMRC_DIR="$GITHUB_ETC_DIR/vim"
GITHUB_VIMPERATOR_DIR="$GITHUB_ETC_DIR/vimperator"
GITHUB_XMODMAP="$GITHUB_ETC_DIR/keyboard/xmodmap"
GITHUB_KARABINER="$GITHUB_ETC_DIR/keyboard/karabiner.xml"
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

function install_vimperatorrc()
{
    local target_rc=~wolfwzr/.vimperatorrc
    local rc="common.vimperatorrc"

    [ -e $target_rc -o -L $target_rc ] && rm -f $target_rc
    make_symlink "$GITHUB_VIMPERATOR_DIR/$rc" ~wolfwzr/.$rc
    echo "source ~/.$rc" > $target_rc

    if [ "$OS_TYPE" = "osx" ]
    then
        rc="osx.vimperatorrc"
        make_symlink "$GITHUB_VIMPERATOR_DIR/$rc" ~wolfwzr/.$rc
        echo "source ~/.$rc" >> $target_rc
    fi
}

function install_keyboard_config()
{
    local target_conf=""

    if [ "$OS_TYPE" = "osx" ]
    then
        target_conf="/Users/wolfwzr/Library/Application Support/Karabiner/private.xml"
        make_symlink "$GITHUB_KARABINER" "$target_conf"
    else
        target_conf=~wolfwzr/.Xmodmap
        make_symlink "$GITHUB_XMODMAP" "$target_conf"
    fi
}

echo "install vimrc"
install_vimrc

echo "install bashrc"
install_bashrc

echo "install vimperatorrc"
install_vimperatorrc

echo "install hosts"
make_symlink "$GITHUB_HOSTS" /etc/hosts

echo "install keyboard config"
install_keyboard_config
