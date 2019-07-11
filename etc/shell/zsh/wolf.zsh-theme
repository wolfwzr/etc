# left prompt(PROMPT): colors baseed on robbyrussell theme

# non-tmux edition PROMPT
#PS_RET_STATUS="%(?::%{$fg[red]%}${?}✗)"
#if [ $(id -u) -eq 0 ]; then
#    PS_USER="%{$fg_bold[red]%}%n"
#else
#    PS_USER="%{$fg[cyan]%}%n"
#fi
#PS_USER="$PS_USER%{$fg[cyan]%}@%m%{$reset_color%}%{$bg[white]%}"
#PROMPT='%{$bg[white]%}${PS_RET_STATUS}%{$bg[white]%}%{$fg[cyan]%}[${PS_USER} %c%{$fg[cyan]%}]%{$reset_color%} '

# tmux edition PROMPT
#PS_RET_STATUS="%(?::%{$fg[red]%}${?}✗ )"
#PS=""
#if [ $(id -u) -eq 0 ]; then
#    PS="%{$fg_bold[red]%}%n%{$fg[cyan]%}@"
#fi
#PS="$PS%{$reset_color%}%{$fg[cyan]%}%c"
#PROMPT='%{$fg[cyan]%}${PS_RET_STATUS}${PS} \$ %{$reset_color%}'
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='%{$fg_bold[cyan]%}%c ${ret_status}%{$reset_color%} '

# if using vi mode command line edit, please uncomment this lines to set right-side prompt
#   right prompt(RPROMPT): vi mode
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
