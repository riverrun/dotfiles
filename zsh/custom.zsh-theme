if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='${return_code} %{$fg[blue]%}%c %{$fg[green]%}%(!.#.»)%{$reset_color%} '
RPS1='$(git_mode)$(git_prompt_short_sha)$(git_prompt_info)'

GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
GIT_PROMPT_SUFFIX="%{$reset_color%} "
GIT_PROMPT_CLEAN=" ✔ "
GIT_PROMPT_DIRTY=" ⚡"
GIT_PROMPT_MODE_BEFORE="%{$fg[red]%}"
GIT_PROMPT_MODE_AFTER="%{$reset_color%} "
GIT_PROMPT_SHA_BEFORE="%{$fg[green]%}"
GIT_PROMPT_SHA_AFTER="%{$reset_color%} "
