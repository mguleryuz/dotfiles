#!/bin/bash

# Step 1: Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Step 2: Install Required Software
echo "Installing required software with Homebrew..."
# Tap the necessary repositories
brew tap FelixKratz/formulae
# Install all required software
brew install --cask iterm2
brew install neofetch koekeishiya/formulae/skhd koekeishiya/formulae/yabai sketchybar bat
# Install the necessary fonts & symbols
brew install sf-symbols font-jetbrains-mono-nerd-font font-hack-nerd-font

# Step 3: Configure Scripting Addition for Yabai
echo "Checking SIP status..."
SIP_STATUS=$(csrutil status)

if echo "$SIP_STATUS" | grep -qE "System Integrity Protection status: (disabled|unknown)"; then
    echo "SIP is disabled. Configuring sudoers for yabai..."
    # Overwrite the existing sudoers entry for yabai
    sudo sh -c "echo \"$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d ' ' -f 1) $(which yabai) --load-sa\" > /private/etc/sudoers.d/yabai"
else
    echo "SIP is enabled. Skipping yabai sudoers configuration."
fi

# Step 4: Install Oh My Zsh and Plugins
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# Step 4.1: Install Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# Step 5: Disable native space order settings
echo "Please manually disable the following Mission Control settings:"
echo "- Automatically rearrange Spaces based on recent use"
echo "- When Switching to an application, switch to a Space with open windows for the application"

# Step 6: Copy Over Configuration Files
echo "Copying configuration files..."
cp -r zsh ~/.config
cp -r yabai ~/.config
cp -r skhd ~/.config
cp -r sketchybar ~/.config

# Step 7: Restart Services
echo "Restarting services..."
yabai --restart-service
skhd --restart-service
brew services start sketchybar

echo "Setup complete! Enjoy your new environment."
