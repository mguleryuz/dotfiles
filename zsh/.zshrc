# Check if running in iTerm2 and run neofetch
if test "$TERM_PROGRAM" = "iTerm.app"; then
    neofetch
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load environment variables
source /Users/anon/.zshenv

# Paths
export PATH="$PATH:/Users/anon/.foundry/bin"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# Bun installation
export BUN_INSTALL="$HOME/.bun"
[ -s "/Users/anon/.bun/_bun" ] && source "/Users/anon/.bun/_bun"

# bun completions
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

# Load Custom Zsh Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.config/zsh/monokai-charcoal.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
