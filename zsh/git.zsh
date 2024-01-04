# This is a shortened version of the oh-my-zsh git.zsh file, together with
# the `git_mode` function, which shows a warning if the repo is bisecting,
# merging or rebasing.
#
# The git prompt's git commands are read-only and should not interfere with
# other processes. This environment variable is equivalent to running with `git
# --no-optional-locks`, but falls back gracefully for older versions of git.
# See git(1) for and git-status(1) for a description of that flag.
#
# We wrap in a local function instead of exporting the variable directly in
# order to avoid interfering with manually-run git commands by the user.
function __git_prompt_git() {
    GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# Outputs current branch info in prompt format
function git_prompt_info() {
    local ref
    ref=$(__git_prompt_git symbolic-ref HEAD 2> /dev/null) || \
        ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return 0
            echo "$GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$GIT_PROMPT_SUFFIX"
        }

# Checks if working tree is dirty
function parse_git_dirty() {
    local STATUS
    local -a FLAGS
    FLAGS=('--porcelain')
    STATUS=$(__git_prompt_git status ${FLAGS} 2> /dev/null | tail -n1)
    if [[ -n $STATUS ]]; then
        echo "$GIT_PROMPT_DIRTY"
    else
        echo "$GIT_PROMPT_CLEAN"
    fi
}

# Formats prompt string for current git commit short SHA
function git_prompt_short_sha() {
    local SHA
    SHA=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) && echo "$GIT_PROMPT_SHA_BEFORE$SHA$GIT_PROMPT_SHA_AFTER"
}

# Shows if the repo is in the middle of bisecting, merging or rebasing.
git_mode() {
    local repo_path=$(__git_prompt_git rev-parse --git-dir 2> /dev/null)
    local MODE
    if [[ -e "$repo_path/BISECT_LOG" ]]; then
        MODE="[BISECTING]"
    elif [[ -e "$repo_path/MERGE_HEAD" ]]; then
        MODE="[MERGING]"
    elif [[ -e "$repo_path/CHERRY_PICK_HEAD" ]]; then
        MODE="[CHERRY PICKING]"
    elif [[ -e "$repo_path/REVERT_HEAD" ]]; then
        MODE="[REVERTING]"
    elif [[ -e "$repo_path/rebase" || -e "$repo_path/rebase-apply" || -e "$repo_path/rebase-merge" || -e "$repo_path/../.dotest" ]]; then
        MODE="[REBASING]"
    fi
    [ -n $MODE ] && echo "$GIT_PROMPT_MODE_BEFORE$MODE$GIT_PROMPT_MODE_AFTER"
}
