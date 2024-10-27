# Kill the ssh-agent if it is running
if pgrep -u "$USER" -l ssh-agent > /dev/null; then
    pkill -u "$USER" ssh-agent
fi
