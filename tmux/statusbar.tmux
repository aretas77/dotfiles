##
## Status bar design
##

# Where tmux pane name is shown left or right
set -g status-justify left
set -g status-bg default
set -g status-fg red

# Update the status line every 2 seconds (default is 15s)
set -g status-interval 2

set -g status-position bottom
# set -g status-bg colour18
# set -g status-fg colour137
# set -g status-attr dim
#set -g status-left ''
#set -g status-right ''
set -g window-status-separator ''

#set-option -g status-attr default
#set-window-option -g window-status-fg "#666666"
#set-window-option -g window-status-bg default
#set-window-option -g window-status-attr default
#set-window-option -g window-status-current-fg red
#set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr default

##
## Window status
##

#setw -g window-status-format " #F#I:#W#F "
#setw -g window-status-current-format " #F#I:#W#F "
#setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=colour8] #W "
#setw -g window-status-current-format "#[bg=brightmagenta]#[fg=colour8] #I #[fg=colour8]#[bg=colour14] #W "
#setw -g window-status-current-bg colour0
#setw -g window-status-current-fg colour11
#setw -g window-status-current-attr dim
#setw -g window-status-bg green
#setw -g window-status-fg black
#setw -g window-status-attr reverse

# loud or quiet?
set-option -g visual-bell off
set-option -g visual-silence off
set-option -g bell-action none

# modes
setw -g clock-mode-colour colour135
