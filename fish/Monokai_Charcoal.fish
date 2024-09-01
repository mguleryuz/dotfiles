# Monokai Charcoal Theme for Fish Shell

# General color settings
set fish_color_normal white
set fish_color_command $fish_color_normal
set fish_color_param "#E6DB74"  # Yellow for strings
set fish_color_comment "#FD971F"  # Orange for comments
set fish_color_keyword "#F92672"  # Pink for keywords
set fish_color_quote "#AE81FF"  # Purple for constants and numbers
set fish_color_redirection $fish_color_normal
set fish_color_end "#F92672"  # Pink for end of command
set fish_color_error "#F92672"  # Pink for errors

# Search match colors
set fish_color_search_match --background="#6688cc"  # Blueish background

# Syntax highlighting for command substitutions and variables
set fish_color_operator $fish_color_normal
set fish_color_escape "#66D9EF"  # Cyan for escapes
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_valid_path "--underline"

# Color for autosuggestions and selection
set fish_color_autosuggestion "#505050"  # Grey for suggestions
set fish_color_selection --background="#6688cc"  # Blueish background

# Pager colors
set fish_pager_color_completion "#FFFFFF" --background="#000000"
set fish_pager_color_description "#43B9D8"
set fish_pager_color_prefix white --bold --underline
set fish_pager_color_progress "#43B9D8" --background="#000000"

# Prompt colors
set -g fish_color_host normal
set -g fish_color_user "#A6E22E"  # Green for user
set -g fish_color_status red
set -g fish_color_user_root red

# Git colors for fish_git_prompt
set fish_color_git_user "#A6E22E"  # Green for user
set fish_color_git_dirty "#F92672"  # Pink for dirty
set fish_color_git_clean "#A6E22E"  # Green for clean

# Set up prompt with the theme colors
function fish_prompt
    # Use the prompt colors set above
    set_color $fish_color_user
    echo -n (whoami) " "
    set_color normal
    echo -n (prompt_pwd) ' '
    set_color $fish_color_git_user
    __fish_git_prompt
    set_color normal
    echo -n '> '
end

# Source this file in your ~/.config/fish/config.fish to apply the theme
