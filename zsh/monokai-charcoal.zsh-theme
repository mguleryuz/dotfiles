# Monokai Charcoal Theme for Zsh

# General color settings
autoload -U colors && colors

# Define colors (from Monokai)
typeset -A FG
FG[normal]="white"
FG[command]="$FG[normal]"
FG[param]="#E6DB74"   # Yellow for strings
FG[comment]="#FD971F" # Orange for comments
FG[keyword]="#F92672" # Pink for keywords
FG[quote]="#AE81FF"   # Purple for constants and numbers
FG[end]="#F92672"     # Pink for end of command
FG[error]="#F92672"   # Pink for errors

# Search match colors
typeset -A BG
BG[search_match]="#6688cc" # Blueish background

# Prompt colors
FG[escape]="#66D9EF" # Cyan for escapes
FG[cwd]="green"
FG[cwd_root]="red"
FG[autosuggestion]="#505050" # Grey for autosuggestions
FG[selection]="#6688cc"      # Blueish background for selection

# Git prompt colors
FG[git_user]="#A6E22E"   # Green for Git user
FG[git_dirty]="#F92672"  # Pink for dirty
FG[git_clean]="#A6E22E"  # Green for clean
FG[git_branch]="#66D9EF" # Cyan for branch name

# Zsh Prompt Setup
setopt prompt_subst

# Git prompt function (You can customize or extend this function)
function git_prompt_info() {
  if [[ -n $(git status 2>/dev/null | grep 'modified\|staged') ]]; then
    echo "%F{${FG[git_dirty]}}⚡%f"
  elif git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "%F{${FG[git_clean]}}✔%f"
  fi
}

# Find and set branch name var if in git repository.
function git_branch_name() {
  branch=$(git symbolic-ref HEAD 2>/dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]]; then
    :
  else
    echo "%F{${FG[git_branch]}}- ($branch)%f"
  fi
}

# Define the prompt
PROMPT='%F{${FG[user]}}%n%f %F{${FG[cwd]}}%~%f $(git_branch_name) %F{${FG[command]}}>%f '
RPROMPT='%F{${FG[git_user]}}$(git_prompt_info)%f'

# Zsh Autosuggestions and selection color (if you use zsh-syntax-highlighting or zsh-autosuggestions)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=${FG[autosuggestion]}"
ZSH_HIGHLIGHT_STYLES[selection]="fg=white,bg=${BG[selection]}"

# Source this file in your ~/.zshrc to apply the theme
