if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='${return_code} %{$fg[blue]%}%~ %{$fg[green]%}%(!.#.»)%{$reset_color%} '
RPS1='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}± %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="⚡"
