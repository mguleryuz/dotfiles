#!/bin/bash

# Step 1: Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Step 2: Install Required Software
echo "Installing required software with Homebrew..."
brew install --cask sf-symbols
brew install --cask iterm2
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install neofetch
brew tap FelixKratz/formulae
brew install jq
brew install gh
brew install sketchybar
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.23/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

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
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/nice-regex/zsh-npm-scripts-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-npm-scripts-autocomplete

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

# Step 7: Source Zsh configuration
echo "Sourcing Zsh configuration..."
echo "source ~/.config/zsh/.zshrc" >>~/.zshrc

# Step 8: Restart Services
echo "Restarting services..."
yabai --restart-service
skhd --restart-service
brew services start sketchybar

echo "Setup complete! Enjoy your new environment."
