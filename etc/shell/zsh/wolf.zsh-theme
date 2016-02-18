# left prompt(PROMPT): colors baseed on robbyrussell theme
PS_RET_STATUS="%(?::%{$fg[red]%}${?}✗)"
if [ $(id -u) -eq 0 ]; then
    PS_USER="%{$fg_bold[red]%}%n"
else
    PS_USER="%{$fg[cyan]%}%n"
fi
PS_USER="$PS_USER%{$fg[green]%}@%{$fg[blue]%}%m%{$reset_color%}%{$bg[black]%}"
#PROMPT='%{$bg[black]%}${PS_RET_STATUS}%{$fg[cyan]%}[%{$fg[bule]%}%* ${PS_USER} %{$fg[green]%}%c%{$fg[cyan]%}]%{$reset_color%} '
PROMPT='%{$bg[black]%}${PS_RET_STATUS}%{$fg[cyan]%}[${PS_USER} %{$fg[green]%}%c%{$fg[cyan]%}]%{$reset_color%} '

# if using vi mode command line edit, please uncomment this lines to set right-side prompt
#   right prompt(RPROMPT): vi mode
#   VIMODE=''
#   function zle-line-init zle-keymap-select {
#       #VIMODE="${${KEYMAP/vicmd/NOR}/(main|viins)/INS}"
#       VIMODE="${${KEYMAP/vicmd/N}/(main|viins)/}"
#       zle reset-prompt
#   }
#   function zle-line-finish {
#       VIMODE=''
#       zle reset-prompt
#   }
#   zle -N zle-line-init 
#   zle -N zle-line-finish
#   zle -N zle-keymap-select
#   RPROMPT='%{$bg[black]%}%{$fg[green]%}${VIMODE}%{$reset_color%}'
