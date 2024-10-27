#!/bin/zsh

if ! pgrep -u "$USER" -l ssh-agent > /dev/null; then
	eval $(ssh-agent -s) > /dev/null 2>&1
fi
