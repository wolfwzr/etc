#! /bin/bash

GITHUB_REPO_DIR=$(cd $(dirname "$0") && pwd)

GITHUB_VIMRC_DIR="$GITHUB_REPO_DIR/vimrc"
GITHUB_VIMPERATORRC_DIR="$GITHUB_REPO_DIR/vimperatorrc"
GITHUB_BASHRC_DIR="$GITHUB_REPO_DIR/bashrc"
GITHUB_HOSTS_DIR="$GITHUB_REPO_DIR/hosts"

function install_vimrc()
{
    local user_vim_dir=~wolfwzr/.vim

    mkdir -p "$user_vim_dir"
    ls "$GITHUB_VIMRC_DIR" | while read file
    do
        [ -e "$user_vim_dir/$file" ] \
            && mv -f "$user_vim_dir/$file" "$user_vim_dir/$file.bak"
        ln -s "$GITHUB_VIMRC_DIR/$file" "$user_vim_dir/$file"
    done
}

function install_vimperatorrc()
{
    local github_vimperatorrc="$GITHUB_VIMPERATORRC_DIR/vimperatorrc"
    local target_file=~wolfwzr/.vimperatorrc

    [ -e "$target_file" ] && mv -f "$target_file" "$target_file.bak"
    ln -s "$github_vimperatorrc" "$target_file"
}

function install_bashrc()
{
    local github_bashrc="$GITHUB_BASHRC_DIR/bashrc"
    local target_file=/etc/wolfwzr.bashrc
    local system_bashrc=/etc/bash.bashrc

    [ -e "$target_file" ] && mv -f "$target_file" "$target_file.bak"
    ln -s "$github_bashrc" "$target_file"

    grep -v "^[ \t]*#" "$system_bashrc" | grep -s -q "source[ \t]\+$target_file"
    if [ $? -ne 0 ]
    then
        cp -f "$system_bashrc" "$system_bashrc.bak"
        echo "source $target_file" >> "$system_bashrc"
    fi
}

function install_hosts()
{
    local github_hosts="$GITHUB_HOSTS_DIR/hosts"
    local system_hosts=/etc/hosts

    [ -e "$system_hosts" ] && mv -f "$system_hosts" "$system_hosts.bak"
    ln -s "$github_hosts" "$system_hosts"
}

install_vimrc
install_vimperatorrc
install_bashrc
install_hosts
