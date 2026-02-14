if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

function fish_greeting
    set -l quotes \
        "All that we see or seem is but a dream within a dream." \
        "Deep into that darkness peering, long I stood there wondering, fearing..." \
        "Quoth the Raven 'Nevermore'." \
        "I became insane, with long intervals of horrible sanity." \
        "Words have no power to impress the mind without the exquisite horror of their reality."

    set -l random_quote (random choice $quotes)

    echo -e "\n\"$random_quote\""
    echo -e "  — Edgar Allan Poe\n"
end

function fish_prompt
    # 1. Nome de usuário entre parênteses
    set_color normal
    echo -n '╭─('
    set_color green
    echo -n "$USER"
    set_color normal
    echo -n ') '

    # 2. Diretório atual (usa '~' para $HOME
    set_color bryellow
    echo -n "🢒 "
    set_color blue
    echo -n (prompt_pwd)
    set_color normal
    echo -n ' '

    # 3. Branch do Git entre colchetes
    set -l git_branch (__fish_git_prompt)

    if [ -n "$git_branch" ]
        set_color bryellow
        echo -n "🢒"
        set_color normal
        echo -n "$git_branch"
    end

    # 4. Tempo de execução do último comando (com o símbolo de cruz)
    set -l duration_ms $CMD_DURATION

    if [ -n "$duration_ms" ]; and [ "$duration_ms" -gt 500 ] # Só mostra se for maior que 500ms
        set -l duration_s (math -s 0 -- "$duration_ms / 1000")
        set_color normal
        echo -n ' 🢒 '
        set_color red
        echo -n '🕇'
        set_color normal
        echo -n " $duration_s"
        echo -n s
    else if [ -n "$git_branch" ] # Se não houver duração, mas houver branch, adicione a seta de espaçamento
        set_color bryellow
        echo -n ' 🢒'
    end

    # Nova linha e seta final
    echo
    set_color normal
    echo -n '╰─🢒'
    set_color normal # Garante que a entrada de texto seja normal
end

export PATH="$HOME/.emacs.d/bin:$PATH"
eval "$(zoxide init fish)"
eval "$(mise activate fish)"

alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="z"
alias cat="bat"
alias n="nvim ."
alias ai="opencode-jail"

#export ATUIN_NOBIND=true
#bindkey "^R" atuin-search
export PATH="$HOME/.local/bin:$PATH"
