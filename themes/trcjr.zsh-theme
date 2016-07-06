function prompt_char {
    # The ± character breaks the prompt after tab completion, so changing to %
    #git branch >/dev/null 2>/dev/null && echo '±' && return
    git branch >/dev/null 2>/dev/null && echo '%%' && return
    #hg root >/dev/null 2>/dev/null && echo '☿' && return
    #echo '○'
    echo '$'
}


function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`')'
}

function hg_prompt_info {
    hg prompt --angle-brackets "\
< on %{$fg[magenta]%}<branch>%{$reset_color%}>\
< at %{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

PROMPT='%{$fg[yellow]%}[%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[red]%}%c%{$reset_color%}$(virtualenv_info)$(git_prompt_info)%{$fg[yellow]%}]%{$reset_color%}$(prompt_char) '

if [[ -n $BAT_CHARGE ]]
then
    RPROMPT='$(battery_charge)'
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""


