# Based on robbyrussell theme

# colors: magenta

local ret_status="%(?::%{$fg[red]%}${?}✗)"

if [ $(id -u) -eq 0 ]; then
    local user="%{$fg_bold[red]%}%n"
else
    local user="%{$fg[cyan]%}%n"
fi
user="$user%{$reset_color%}%{$bg[black]%}"

PROMPT='%{$bg[black]%}${ret_status}%{$fg[cyan]%}[%{$fg[bule]%}%* ${user} %{$fg[green]%}%c%{$fg[cyan]%}]%{$reset_color%} '
RPROMPT='%{$bg[black]%}%{$fg[green]%}${VIMODE}%{$reset_color%}'
#RPROMPT='%{$fg[green]%}${VIMODE}%{$reset_color%}'

#PROMPT='%{$bg[black]%}${ret_status}%{$fg[cyan]%}[%{$fg[bule]%}%* ${user} %{$fg[blue]%}$(git_prompt_info)%{$fg[green]%}%c%{$fg[cyan]%}]%{$reset_color%} '

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX=" "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+"
#ZSH_THEME_GIT_PROMPT_CLEAN=""
