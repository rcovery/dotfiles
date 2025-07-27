# Tech Gothic Starship Prompt for Zsh
# Add this to your .zshrc: source /path/to/tech-gothic-prompt.zsh

# Enable command timing
preexec() {
    cmd_start_time=$SECONDS
}

precmd() {
    if [[ -n $cmd_start_time ]]; then
        local elapsed=$((SECONDS - cmd_start_time))
        if [[ $elapsed -gt 0 ]]; then
            cmd_elapsed="${elapsed}s"
        else
            cmd_elapsed=""
        fi
        unset cmd_start_time
    else
        cmd_elapsed=""
    fi
}

# Simple prompt symbols
local arrow="🢒"
local timer="🕇"

# Color definitions
local red='%F{196}'
local orange='%F{208}'
local yellow='%F{226}'
local green='%F{46}'
local cyan='%F{51}'
local blue='%F{21}'
local purple='%F{129}'
local magenta='%F{201}'
local white='%F{255}'
local gray='%F{240}'
local reset='%f'

# Function to get git branch
git_branch() {
    local branch
    if git rev-parse --git-dir >/dev/null 2>&1; then
        branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        if [[ -n $branch ]]; then
            echo "[${branch}]"
        fi
    fi
}

# Function to get command execution time
get_cmd_time() {
    if [[ -n $cmd_elapsed ]]; then
        echo "${timer} ${cmd_elapsed}"
    fi
}

# Function to get current directory with simple styling
get_directory() {
    local dir="${PWD/#$HOME/~}"
    echo "${dir}"
}

# Function to get username with simple styling
get_user() {
    echo "(${USER})"
}

# Main prompt function
build_prompt() {
    local user_part=$(get_user)
    local dir_part=$(get_directory)
    local git_part=$(git_branch)
    local time_part=$(get_cmd_time)
    
    # Top line with user, directory, git branch, and time
    local top_line="╭─${user_part}"
    
    top_line+=" ${arrow} ${dir_part}"
    
    if [[ -n $git_part ]]; then
        top_line+=" ${arrow} ${git_part}"
    fi
    
    if [[ -n $time_part ]]; then
        top_line+=" ${arrow} ${time_part}"
    fi
    
    # Bottom line with prompt
    local bottom_line="╰─${arrow}"
    
    echo -e "${top_line}\n${bottom_line}"
}

# Set the prompt
setopt PROMPT_SUBST
PROMPT='$(build_prompt)'

# Clear right prompt
RPS1=""
