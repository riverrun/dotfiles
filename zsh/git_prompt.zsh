# Adapted from code found at <https://gist.github.com/1712320>.

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Modify the colors and symbols in these variables as desired.
#GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
GIT_PROMPT_AHEAD="%F{red}↑NUM%f"
GIT_PROMPT_BEHIND="%F{cyan}↓NUM%f"
GIT_PROMPT_UNTRACKED="%F{red}?%f"
GIT_PROMPT_MODIFIED="%F{blue}✚%f"
GIT_PROMPT_STAGED="%F{green}●%f"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  if git diff-index --quiet HEAD 2> /dev/null; then
    local GIT_STATE="%F{blue}✓%f "
  else
    local GIT_STATE="%F{red}✗%f "
  fi

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_STATE "
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_branch="$(parse_git_branch)"
  [ -n "$git_branch" ] && echo "$(parse_git_state)%U%F{yellow}${git_branch#(refs/heads/|tags/)}%f%u"
}

# Set the right-hand prompt
#RPS1='$(git_prompt_string)'
