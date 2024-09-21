# Mguleryuz's `yabai` `skhd` `sketchybar` `iTerm2` `zsh` Configuration

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

## Run the setup script

```bash
chmod +x setup.sh && ./setup.sh
```

You're all set! Enjoy your new setup 🚀.
