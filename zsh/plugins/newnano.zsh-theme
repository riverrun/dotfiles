local return_code="%(?..%B%F{red}:( %?%f%b)"

PROMPT='${return_code} %F{blue}%n%f %F{yellow}%~%F{blue} ▶%f '
RPROMPT='$(git_prompt_info) '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✘%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
