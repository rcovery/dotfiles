source ~/.rcovery-prompt.zsh

USE_POWERLINE="true"
HAS_WIDECHARS="false"

if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias ls="eza --icons always"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"


. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

export ATUIN_NOBIND=true
bindkey "^R" atuin-search

# incremental history search with arrow keys
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward]]
