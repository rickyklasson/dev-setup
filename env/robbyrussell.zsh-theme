# Colors
RESET="%f"
BLUE="%F{blue}"
GREEN="%F{green}"
MAGENTA="%F{magenta}"
CYAN="%F{cyan}"
YELLOW="%F{yellow}"
ORANGE="%F{214}"  # Orange color (ANSI 214)

# Git status function
git_status() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    [ -z "$branch" ] && return  # Exit if not in a Git repo

    # Get counts of changed, untracked, and staged files
    local staged=$(git diff --cached --name-only | wc -l | tr -d ' ')  # Staged files
    local changes=$(git diff --name-only --diff-filter=M | wc -l | tr -d ' ')  # Unstaged modified files
    local untracked=$(git status --porcelain 2>/dev/null | grep '^??' | wc -l | tr -d ' ')

    # Build git information with colors
    local git_info=""
    ((staged > 0)) && git_info+=" ${GREEN}+${staged}${RESET}"
    ((changes > 0)) && git_info+=" ${YELLOW}!${changes}${RESET}"
    ((untracked > 0)) && git_info+=" ${MAGENTA}?${untracked}${RESET}"

    # Return branch and git_info if available
    echo "(${branch})${git_info}"
}

# Build the left-side prompt (current folder, git status, separator)
PROMPT='${BLUE}%2~${RESET} ${GREEN}$(git_status)${RESET} $ '

# Build the right-side prompt (Python venv and time of day)
RPROMPT='${CYAN}$(if [[ -n $VIRTUAL_ENV ]]; then echo "(${${VIRTUAL_ENV:t}})"; fi)${RESET}'

