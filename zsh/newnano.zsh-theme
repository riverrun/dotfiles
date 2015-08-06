local return_code="%(?..%B%F{red}:( %?%f%b)"

PROMPT='${return_code} %F{blue}%n%f %F{yellow}%~%F{blue} ▶%f '
RPROMPT='$(git_prompt_string) '
