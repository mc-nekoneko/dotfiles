# Titles
set -g set-titles on
set -g set-titles-string '#H: #W'

#set -g status-justify left 

# Left line
set -g status-left "#[fg=colour238,bold bg=colour255] #S #[bg=colour234]"
set -g status-left-length 15

# Right line
set -g status-right "#[fg=colour255] #(uname -s) :: #h #[fg=colour250 bg=colour237]  %y-%m-%d | %H:%M:%S #[fg=colour234,bold bg=colour255]  #(whoami) "
set -g status-right-length 70

# Text Color
#set -g status-fg "colour245"
##set -g status-bg "colour235"
#set -g status-bg "colour0"
set -g status-fg "colour237"
set -g status-bg "colour234"

# Position
set -g status-position bottom

# Window tab
#setw -g window-status-format "#[fg=colour254 bg=colour240] #I#F/ #W "
setw -g window-status-format "#[fg=colour247] #I / #[fg=colour255]#W#F "
setw -g window-status-current-format "#[fg=colour231 bg=colour161] #I / #[fg=colour255]#W#F "
#setw -g window-status-format "#[fg=colour245 bg=colour235] #I:#W#F "

# Border Color
set -g pane-border-fg white
set -g pane-border-bg black
set -g pane-active-border-bg white
set -g pane-active-border-bg black

# Message
set -g message-fg "colour255"
set -g message-bg "colour24"
