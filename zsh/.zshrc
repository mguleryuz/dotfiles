# Load environment variables
source /Users/anon/.zshenv

# Oh My Zsh installation path
export ZSH="$HOME/.oh-my-zsh"

# Bun installation
export BUN_INSTALL="$HOME/.bun"
[ -s "/Users/anon/.bun/_bun" ] && source "/Users/anon/.bun/_bun"

# Paths
export PATH="$PATH:/Users/anon/.foundry/bin"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
# Initialize fnm
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env)"

# Oh My Zsh plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    zsh-npm-scripts-autocomplete
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load custom theme
source ~/.config/zsh/monokai-charcoal.zsh-theme

# Check if running in iTerm2 and run neofetch
if test "$TERM_PROGRAM" = "iTerm.app"; then
    neofetch
fi

# Uncomment the following lines to enable specific features

# Case-sensitive completion
# CASE_SENSITIVE="true"

# Hyphen-insensitive completion (requires case-sensitive completion to be off)
# HYPHEN_INSENSITIVE="true"

# Auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Auto-update frequency (in days)
# zstyle ':omz:update' frequency 13

# Disable magic functions if pasting URLs and other text is messed up
# DISABLE_MAGIC_FUNCTIONS="true"

# Disable colors in ls
# DISABLE_LS_COLORS="true"

# Disable auto-setting terminal title
# DISABLE_AUTO_TITLE="true"

# Enable command auto-correction
# ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change the command execution timestamp shown in the history command output
# HIST_STAMPS="mm/dd/yyyy"

# Use another custom folder than $ZSH/custom
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# Set MANPATH
# export MANPATH="/usr/local/man:$MANPATH"

# Set language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Personal aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
