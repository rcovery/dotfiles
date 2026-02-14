eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"

source ~/.config/zsh/prompt.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

USE_POWERLINE="true"
HAS_WIDECHARS="false"

alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="z"
alias cat="bat"

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

#export ATUIN_NOBIND=true
#bindkey "^R" atuin-search

# incremental history search with arrow keys
bindkey '^[[3~'   delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "\e\b"    backward-kill-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

export PATH="$HOME/.emacs.d/bin:$PATH"

. "$HOME/.cargo/env"
