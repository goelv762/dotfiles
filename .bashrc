# ~/.bashrc

# aliases
# ______________________________________

# current
cProject='2d-engine'
cYear='2025'

# make / run commands
alias m="cmake -GNinja ..; ninja"
alias md='cmake -GNinja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS_DEBUG="-g -O0" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..; ninja'
alias venv="source venv/bin/activate"

alias gdb="gdb -q"

# misc
alias c="clear"
alias y="yazi"
alias n="nvim"
alias b="bluetuith"
alias h="Hyprland"

alias count='echo "$(ls -1 | wc -l) files"'
alias countRec="tree | tail -n 1"

alias size="du -h"
alias roblox="flatpak run org.vinegarhq.Sober"

alias neofetch="neofetch | sed 's/ with Radeon Graphics//';  date | sed 's/ NZST//'"
alias days="~/projects/info/src/main.sh"

# alias vpn="sudo --preserve-env=WAYLAND_DISPLAY,XDG_RUNTIME_DIR,QT_QPA_PLATFORM dbus-run-session -- nekoray > /dev/null 2>&1"

alias ls="eza -l --git --no-user --no-permissions --no-time --no-filesize"
# project stuff
# ______________________________________

alias p="cd ~/projects/$cProject/; nvim"
alias pt="cd ~/projects/$cProject/"

# trash
# ______________________________________
rm() {
    # Flatten args into a string
    args="$*"

    # Catch dangerous patterns
    if [[ "$args" =~ (^| )(-[rf]+ )?(/|~)( |$) ]]; then
        echo "Refusing to delete home folder"
        return 1
    fi

    # If -rf is used, trash instead
    if [[ "$1" == "-rf" || "$1" == "-fr" ]]; then
        shift
        trash-put "$@"
    else
        command rm "$@"
    fi
}

# other
# ______________________________________

alias grep='grep --color=auto'
# PS='[\u@\h \W]\$ '
show_pwd_bottom() {
    local rows=$(tput lines)
    tput sc
    tput cup $((rows - 1)) 0
    tput el
    local path="$PWD"
    # Replace $HOME with ~ if it matches the start of $PWD
    if [[ "$path" == "$HOME"* ]]; then
        path="~${path#$HOME}"
    fi
    echo -n "$path"
    tput rc
}

PROMPT_COMMAND=show_pwd_bottom
PS1='$ '
. "$HOME/.cargo/env"

# very old, dont know what it does, probably dont touch?
# Created by `pipx` on 2024-10-06 09:23:10
export PATH="$PATH:/home/varun/.local/bin"

# keep at bottom
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
