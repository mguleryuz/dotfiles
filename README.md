# Mguleryuz's `yabai` `skhd` `sketchybar` `iTerm2` `fish` Configuration

<img src="./preview.png" />

# Installation and Setup Instructions

## Step 0: Disabling SIP on M Series Macs

1. **Power off your device**.

2. **Enter Recovery Mode**:

   - Hold the power button until you see the screen say **Loading startup options**.
   - Click **Options** and then **Continue**.

3. **Open Terminal**:

   - In the menu bar, go to **Utilities**, then select **Terminal**.

4. **Disable SIP**:

   - Type the following command into the Terminal:

   ```bash
   csrutil disable --with kext --with dtrace --with basesystem
   ```

   - Warnings can be safely ignored. Afterward, reboot your Mac.

5. **Enable Non-Apple-Signed arm64e Binaries**:

   - Type the following command and reboot:

   ```bash
   sudo nvram boot-args=-arm64e_preview_abi
   ```

   - This command is important because if you don’t do this, scripting additions won’t work. Reboot when the command finishes.

6. **Check SIP Status**:

   - To check if SIP is turned off, run:

   ```bash
   csrutil status
   ```

If you decide you don't want SIP disabled, follow the steps above to enter Recovery Mode again, but type `csrutil enable` instead.

## Step 1: Install Homebrew

First, install Homebrew, the package manager for macOS, if you haven't already. Open the Terminal and run the following command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Step 2: Install Required Software

Once Homebrew is installed, run the following commands to install iTerm2, Yabai, Skhd, Neofetch, and Fish shell:

```bash
brew install --cask sf-symbols
brew install --cask iterm2
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install neofetch
brew install fish
brew tap FelixKratz/formulae
brew install jq
brew install gh
brew install sketchybar
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.23/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
```

## Step 3: Configure Scripting Addition for Yabai

Yabai uses the macOS Mach APIs to inject code into `Dock.app`, which requires elevated (root) privileges. To configure your user to execute `yabai --load-sa` as the root user without having to enter a password, run the one liner:

### Use a One-Liner to Update the Sudoers File

You need to add a new configuration entry that is loaded by `/etc/sudoers`.

```bash
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai
```

## Step 4: Set Fish as Default Shell

To set Fish as your default shell, run:

```bash
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

Restart your terminal for the change to take effect.

## Step 5: Copy Over Configuration Files

Now, copy your configuration files for Fish, Yabai, and Skhd to the appropriate directories. Run the following commands:

1. **Fish configuration**:

   ```bash
   cp -r fish ~/.config
   ```

2. **Yabai configuration**:

   ```bash
   cp -r yabai ~/.config
   ```

3. **Skhd configuration**:

   ```bash
   cp -r skhd ~/.config
   ```

4. **Sketchybar configuration**:

   ```bash
   cp -r sketchybar ~/.config
   ```

## Step 6: Restart Services

Finally, restart the `yabai` and `skhd` services to apply the configurations:

```bash
yabai --restart-service
skhd --restart-service
brew services start sketchybar
```

You're all set! Enjoy your new setup.
