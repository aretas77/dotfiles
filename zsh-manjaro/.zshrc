# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"

plugins=(git)

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi


source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


alias pr="fzf --preview="cat {}" --preview-window=right:70%:wrap"
alias ip="ip --color=auto"
