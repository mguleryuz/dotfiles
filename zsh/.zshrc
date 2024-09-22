# Check if running in iTerm2 and run neofetch
if test "$TERM_PROGRAM" = "iTerm.app"; then
  neofetch
fi

# Load Custom Zsh Theme
eval "$(starship init zsh)"
# source ~/.config/zsh/monokai-charcoal.zsh-theme

# Load environment variables
source /Users/anon/.zshenv

# Paths
export PATH="$PATH:/Users/anon/.foundry/bin"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
# Bun installation
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Bun completions
[ -s "/Users/anon/.bun/_bun" ] && source "/Users/anon/.bun/_bun"

# Initialize fnm
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env)"

# Oh My Zsh installation path
export ZSH="$HOME/.oh-my-zsh"

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

# bat
alias bat='bat --paging=never'
# When you are using zsh, you can also use global aliases to override -h and --help entirely:
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain --paging=never'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain --paging=never'
