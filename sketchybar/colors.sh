#!/bin/bash

### Monokai Charcoal Theme
export BLACK=0xff505050       # Grey for autosuggestions
export WHITE=0xffffffff       # White color for normal text
export RED=0xfff92672         # Pink for errors, end of command, and dirty Git state
export GREEN=0xffa6e22e       # Green for user, clean Git state
export BLUE=0xff6688cc        # Blueish background for search match
export YELLOW=0xffe6db74      # Yellow for strings
export ORANGE=0xfffd971f      # Orange for comments
export MAGENTA=0xffae81ff     # Purple for quotes, constants, and numbers
export GREY=0xff75715e        # Dark grey for various highlights (mapped from diff.header)
export TRANSPARENT=0x00000000 # Transparent color
export BG0=0xff000000         # Black background for editor
export BG1=0xff2c2e34         # Slightly lighter background
export BG2=0xff2c2e34         # Another slightly lighter background color

# General bar colors
export BAR_COLOR=$BG0
export BAR_BORDER_COLOR=$BG1
export BACKGROUND_1=$BG1
export BACKGROUND_2=$BG2
export ICON_COLOR=$WHITE  # Color of all icons
export LABEL_COLOR=$WHITE # Color of all labels
export POPUP_BACKGROUND_COLOR=$BAR_COLOR
export POPUP_BORDER_COLOR=$WHITE
export SHADOW_COLOR=$BLACK
