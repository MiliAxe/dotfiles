function fish_user_key_bindings
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
cat ~/.cache/wal/sequences &

thefuck --alias | source
alias wpc="warp-cli connect"
alias wpdc="warp-cli disconnect"

set -U fish_user_paths $fish_user_paths ~/.local/lib
set -U fish_user_paths $fish_user_paths ~/.local/bin

set -U pure_show_system_time false
# set -g async_prompt_function _pure_prompt_git
set --global tide_left_prompt_items node
