# left prompt(PROMPT): colors baseed on robbyrussell theme
local RET_STATUS="%(?::%{$fg[red]%}${?}✗)"
if [ $(id -u) -eq 0 ]; then
    local USER="%{$fg_bold[red]%}%n"
else
    local USER="%{$fg[cyan]%}%n"
fi
USER="$USER%{$reset_color%}%{$bg[black]%}"
PROMPT='%{$bg[black]%}${RET_STATUS}%{$fg[cyan]%}[%{$fg[bule]%}%* ${USER} %{$fg[green]%}%c%{$fg[cyan]%}]%{$reset_color%} '

# right prompt(RPROMPT): vi mode
VIMODE=''
function zle-line-init zle-keymap-select {
    #VIMODE="${${KEYMAP/vicmd/NOR}/(main|viins)/INS}"
    VIMODE="${${KEYMAP/vicmd/N}/(main|viins)/}"
    zle reset-prompt
}
function zle-line-finish {
    VIMODE=''
    zle reset-prompt
}
zle -N zle-line-init 
zle -N zle-line-finish
zle -N zle-keymap-select
RPROMPT='%{$bg[black]%}%{$fg[green]%}${VIMODE}%{$reset_color%}'
