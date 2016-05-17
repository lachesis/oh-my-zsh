if [[ "$(hostname)" == "svoboda" ]]; then
    local host_color="%{$fg[red]%}"
elif [[ "$(hostname)" == "tron" ]]; then
    local host_color="%{$fg[magenta]%}"
elif [[ "$(hostname)" == "aftbit" || "$(hostname)" == "folklore" ]]; then
    local host_color="%{$fg[blue]%}"
else
    local host_color="%{$reset_color%}"
fi

local user='%n%{$fg[cyan]%}@%{$host_color%}%m%{$reset_color%}'
local pwd='%{$fg[cyan]%}%~%{$reset_color%}'
local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{$fg[green]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'
local hg_branch='%{$fg[green]%}$(_ohmy_hg_fast branch 2> /dev/null)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

PROMPT="${user} ${pwd}$ "
RPROMPT="${return_code} ${git_branch} ${hg_branch} ${rvm}"
