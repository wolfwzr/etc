bash configuration and vim configuration
=================

vim configuration

Dependent Tools:

Vundle plugin
sdcv (command line dictionary tool)
mkd_preview.sh mkd file preview function
bash configuration

Instructions

$ git clone git@github.com:wolfwzr/etc.git somedir
$ cd somedir
$ bash install.sh
Precautions

Mark.vim plug-ins need to be modified (autocmd! Problem), see vundle.vimrc
If the autocmd registration event does not respond, use: autocmd {Event} to see if there is a corresponding registration, if not, from the following found problems:
autocmd statement is executed
autocmd command does not specify the group is the default group, check if autocmd! statement where the statement will first empty the current group of events, you can use: verbose autocmd {Event} to check, or directly check your configuration or Plug-in code.
It is best to autocmd in your own group to avoid the above problems (while avoiding double registration), such as:
augroup wolfwzr_autocmd
    au!
    autocmd BufNew :echom "BufNew"
augroup END
To be functional

vim
Ultisnap code block completion plug-in installed but still not clear usage
Make Use of <Fn>
Make Use of [a-z][0-9], 1
bash
There is doubt

Why VIM can distinguish Alt + j and Alt + Shift + j, but can not distinguish between Ctrl + j and Ctrl + Shift + j?
Set asm type handler set syntax = nasm no effect, even autocmd no effect, why
autocmd FileType asm set syntax=nasm
noft Search is still underline style(no effect in osx)
prompt

Keep the SSH session does not time out
cat ServerAliveInterval 100 >> /etc/ssh/ssh_config
