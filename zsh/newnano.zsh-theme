local return_code="%(?..%B%F{red}:( %?%f%b)"

PROMPT='${return_code} $(_user_host) %F{yellow}%~%f%F{blue} ▶%f '
RPROMPT='$(git_prompt_string) '

function _user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%F{blue}%n@%m%f"
  else
    echo "%F{blue}%n%f"
  fi
}
