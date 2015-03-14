# Based on robbyrussell theme

# colors: magenta

local ret_status="%(?::%{$fg_bold[red]%}${?}✗)"

if [ $(id -u) -eq 0 ]; then
    local user="%{$fg_bold[red]%}%n"
else
    local user="%{$fg[cyan]%}%n"
fi

PROMPT='%{$bg[black]%}${ret_status}%{$fg_bold[cyan]%}[%{$fg[bule]%}%* ${user} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg[green]%}%c%{$fg_bold[cyan]%}]%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN=""
