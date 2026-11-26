#!/bin/bash
clear
if [ -d "/data/data/com.termux/files/usr/" ]; then
    if [ -d "$HOME/.toolx" ]; then
        chmod -R 777 "$HOME/.toolx" 2>/dev/null
        rm -rf "$HOME/.toolx" 2>/dev/null
    fi
else
    if [ -d "$HOME/.toolx" ]; then
        chmod -R 777 "$HOME/.toolx" 2>/dev/null
        rm -rf "$HOME/.toolx" 2>/dev/null
        if [ -d "$HOME/.toolx" ] && command -v sudo >/dev/null 2>&1; then
            sudo chmod -R 777 "$HOME/.toolx" 2>/dev/null
            sudo rm -rf "$HOME/.toolx" 2>/dev/null
        fi
    fi
fi
mkdir -p "$HOME/.BANNER-X"
mkdir -p "$HOME/.Banner-X-simu"
mkdir -p "$HOME/.bannerx"
mkdir -p "$HOME/.bannerx/def"
mkdir -p "$HOME/.bannerx/art"
# dx colors
r='\033[1;91m'
p='\033[1;95m'
y='\033[1;93m'
g='\033[1;92m'
n='\033[1;00m'
b='\033[1;94m'
c='\033[1;96m'

# dx Symbol
X='\033[1;92m[\033[1;00m⎯꯭̽𓆩\033[1;92m]\033[1;96m'
# this logic is added by ox-bannerx-!
if [ -d "/data/data/com.termux/files/usr/" ]; then
    icon="〄"
else
    icon="ଲ"
fi

D='\033[1;92m[\033[1;00m'$icon'\033[1;92m]\033[1;93m'
E='\033[1;92m[\033[1;00m×\033[1;92m]\033[1;91m'
A='\033[1;92m[\033[1;00m+\033[1;92m]\033[1;92m'
C='\033[1;92m[\033[1;00m</>\033[1;92m]\033[92m'
lm='\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m'$icon'\033[96m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'
dm='\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[0m'$icon'\033[93m▱▱▱▱▱▱▱▱▱▱▱▱\033[1;00m'

# dx icon
OS="\uf6a6"
HOST="\uf6c3"
KER="\uf83c"
UPT="\uf49b"
PKGS="\uf8d6"
SH="\ue7a2"
TERMINAL="\uf489"
CHIP="\uf2db"
CPUI="\ue266"
HOMES="\uf015"


# Device Detection
if command -v getprop &>/dev/null; then
    MODEL=$(getprop ro.product.model)
    VENDOR=$(getprop ro.product.manufacturer)
else
    MODEL=$(uname -n)
    VENDOR=$(uname -s)
fi
devicename="${VENDOR} ${MODEL}"
THRESHOLD=100
random_number=$(( RANDOM % 2 ))

if [ -d "/data/data/com.termux/files/usr/" ]; then
   
    exit_script() {
        clear
        echo
        echo
        echo -e ""
        echo -e "${c}              (\_/)"
        echo -e "              (${y}^_^${c})     ${A} ${g}Hey dear${c}"
        echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"              
        echo -e "\n ${g}[${n}${KER}${g}] ${c}Exiting ${g}Banner X Banner \033[1;36m"
        echo
        cd "$HOME"
        rm -rf "$HOME/BANNER-X" >/dev/null 2>&1
        kill -9 $PPID 2>/dev/null
        exit 0
    }
else
    # Fixed by ox-bannerx-! to prevent killed status prints
    exit_script() {
        trap - SIGINT SIGTSTP EXIT
        clear
        echo
        echo
        echo -e ""
        echo -e "${c}              (\_/)"
        echo -e "              (${y}^_^${c})     ${A} ${g}Hey dear${c}"
        echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"              
        echo -e "\n ${g}[${n}${KER}${g}] ${c}Exiting ${g}Banner X Banner \033[1;36m"
        echo
        cd "$HOME"
        rm -rf "$HOME/BANNER-X" >/dev/null 2>&1
        pkill -P $$ >/dev/null 2>&1
        exec 2>/dev/null
        exit 0
    }
fi
if command -v tput &>/dev/null; then
    echo ""
else
    echo -e " ${C} ${g}Waiting for setup Screen!¡${n}"
    if [ -d "/data/data/com.termux/files/usr/" ]; then
        pkg install ncurses-utils -y >/dev/null 2>&1
    else
        sudo apt install ncurses-bin -y >/dev/null 2>&1 || true
    fi
    clear
fi

if command -v curl &>/dev/null; then
    echo ""
else
    if [ -d "/data/data/com.termux/files/usr/" ]; then
        pkg install curl -y >/dev/null 2>&1
    else
        sudo apt install curl -y >/dev/null 2>&1 || true
    fi
    clear
fi

trap exit_script SIGINT SIGTSTP

check_disk_usage() {
    local threshold=${1:-$THRESHOLD}
    local total_size=$(df -h "$HOME" | awk 'NR==2 {print $2}')
    local used_size=$(df -h "$HOME" | awk 'NR==2 {print $3}')
    local disk_usage=$(df "$HOME" | awk 'NR==2 {print $5}' | sed 's/%//g')

    if [ "$disk_usage" -ge "$threshold" ]; then
        echo -e "${g}[${n}\uf0a0${g}] ${r}WARN: ${y}Disk Full ${g}${disk_usage}% ${c}| ${c}U${g}${used_size} ${c}of ${c}T${g}${total_size}"
    else
        echo -e "${y}Disk usage: ${g}${disk_usage}% ${c}| ${g}${used_size}"
    fi
}
data=$(check_disk_usage)

start() {
    clear
    tput civis

    G='\e[1;92m'
    C='\e[1;96m'
    N='\e[0m'

    for text in \
        "「 BANNER X STARTED 」" \
        "「 HELLO DEAR USER I'M DX-SIMU 」" \
        "「 BANNER X WILL PROTECT YOU 」" \
        "「 ENJOY OUR BANNER X 」"; do

        printf "${G}%s${N}\n" "$text"
        sleep 0.15
    done

    tput cnorm
    clear
}

start


tr() {
    if ! command -v curl &>/dev/null; then
        if [ -d "/data/data/com.termux/files/usr/" ]; then
            pkg install curl -y &>/dev/null 2>&1
        else
            sudo apt install curl -y &>/dev/null 2>&1
        fi
    fi
}

IS_TERMUX=0
[[ -n "${TERMUX_VERSION:-}" || "${PREFIX:-}" == *com.termux* ]] && IS_TERMUX=1

if ! command -v apt-get >/dev/null 2>&1; then
    echo -e "${E} Error: apt-get not found. Only Termux/Debian/Ubuntu/Kali supported.${n}"
    exit 1
fi

SUDO=""
if ((IS_TERMUX == 0)) && ((EUID != 0)); then
    if ! command -v sudo >/dev/null 2>&1; then
        echo -e "${E} Error: run as root or install sudo.${n}"
        exit 1
    fi
    sudo -v || exit 1
    SUDO="sudo -n"
fi

pm(){
    $SUDO env DEBIAN_FRONTEND=noninteractive apt-get -y \
        -o Acquire::Retries=3 \
        -o Dpkg::Options::=--force-confold \
        -o Dpkg::Options::=--force-confdef "$@"
}

export GIT_TERMINAL_PROMPT=0
export PATH="$HOME/.local/bin:$PATH"
FAILED=()

tmp=$(mktemp -d) || exit 1
pid=""

kill_tree(){
    local t=$1 s l c f
    for s in /proc/[0-9]*/stat; do
        read -r l <"$s" 2>/dev/null || continue
        c=${s#/proc/}; c=${c%/stat}
        f=(${l##*) })
        [[ ${f[1]} == "$t" ]] && kill_tree "$c"
    done
    kill -TERM "$t" 2>/dev/null
}

stop_job(){
    [[ -n "$pid" ]] || return 0
    kill_tree "$pid"
    wait "$pid" 2>/dev/null
    pid=""
}

cleanup(){
    stop_job
    tput cnorm 2>/dev/null
    command rm -rf "$tmp" 2>/dev/null
    return 0
}
trap cleanup EXIT
trap 'echo; exit 130' INT
trap 'echo; exit 143' TERM
trap '' TSTP

installed(){ dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -q 'ok installed'; }
available(){ apt-cache show "$1" >/dev/null 2>&1; }

run_job(){
    local label=$1 pos=0 dir=1 i rc bar
    shift
    echo -e "\n${A} ${b}Installing ${g}${label}${n}"

    "$@" </dev/null >"$tmp/log" 2>&1 &
    pid=$!

    while kill -0 "$pid" 2>/dev/null; do
        bar=""
        for ((i=0; i<10; i++)); do
            if ((i >= pos && i < pos+3)); then bar+="${g}▰${n}"; else bar+="${c}▱${n}"; fi
        done
        printf '\r\033[2K %b[%b%s%b] %b' "$g" "$n" "$label" "$g" "$bar"
        sleep 0.1 2>/dev/null || read -t 0.1 2>/dev/null
        ((pos+=dir))
        if ((pos >= 7)); then dir=-1; elif ((pos <= 0)); then dir=1; fi
    done

    wait "$pid" 2>/dev/null; rc=$?; pid=""

    bar=""
    if ((rc == 0)); then
        for ((i=0; i<10; i++)); do bar+="${g}▰${n}"; done
        printf '\r\033[2K %b[%b%s%b] %b | %binstalled%b\n' "$g" "$n" "$label" "$g" "$bar" "$g" "$n"
        return 0
    fi

    for ((i=0; i<10; i++)); do bar+="${c}▱${n}"; done
    printf '\r\033[2K %b[%b%s%b] %b | %bFAIL%b\n' "$g" "$n" "$label" "$g" "$bar" "$r" "$n"
    if [[ -s "$tmp/log" ]]; then
        echo -e "${E} last log lines:${n}"
        tail -n 5 "$tmp/log" | sed 's/^/    /'
    fi
    return "$rc"
}
spin(){
    local action_type=$1
    shift

    case "$action_type" in
        "purge_legacy")
            if [ -d "/data/data/com.termux/files/usr/" ]; then
                [ -d "$HOME/.toolx" ] && { chmod -R 777 "$HOME/.toolx" 2>/dev/null; rm -rf "$HOME/.toolx" 2>/dev/null; }
            else
                [ -d "$HOME/.toolx" ] && {
                    chmod -R 777 "$HOME/.toolx" 2>/dev/null
                    rm -rf "$HOME/.toolx" 2>/dev/null
                    if [ -d "$HOME/.toolx" ] && command -v sudo >/dev/null 2>&1; then
                        sudo chmod -R 777 "$HOME/.toolx" 2>/dev/null
                        sudo rm -rf "$HOME/.toolx" 2>/dev/null
                    fi
                }
            fi
            ;;
        "update")
            local i
            for i in 1 2 3; do pm update && return 0; sleep 2; done
            return 1
            ;;
        "upgrade")
            local i
            for i in 1 2 3; do
                pm update --fix-missing || true
                pm upgrade --fix-missing && return 0
                sleep 2
            done
            return 1
            ;;
        "pkg")
            local w=$1
            installed "$w" && return 0
            if ! available "$w"; then
                return 0
            fi
            run_job "$w" pm install --fix-missing "$w"
            ;;
        "lolcat")
            command -v lolcat >/dev/null 2>&1 && return 0
           
            # Try apt first on Linux if available
            if ((IS_TERMUX == 0)) && available lolcat; then
                run_job "lolcat" pm install lolcat && return 0
            fi
           
            # Try python pip with safe flags for modern Linux & Termux
            local py
            py=$(command -v python3 || command -v python)
            if [[ -n "$py" ]]; then
                run_job "lolcat" "$py" -m pip install --break-system-packages lolcat 2>/dev/null || \
                run_job "lolcat" "$py" -m pip install lolcat 2>/dev/null || true
            fi
           
           
            if ! command -v lolcat >/dev/null 2>&1 && command -v gem >/dev/null 2>&1; then
                run_job "lolcat" $SUDO gem install lolcat 2>/dev/null || true
            fi
           
            command -v lolcat >/dev/null 2>&1 && return 0
            return 0  
            ;;
        "git_clone")
            local repo_url=$1 target_dir=$2
            [[ -d "$target_dir" ]] && return 0
            run_job "$(basename "$target_dir")" git clone --depth 1 "$repo_url" "$target_dir"
            ;;
    esac
}

setup_termux_paths() {
    mkdir -p "$HOME/.bannerx"
    ox="$HOME/.termux"
    mkdir -p "$ox"
    dx="$ox/font.ttf"
    simu="$ox/colors.properties"
   
    [ ! -f "$dx" ] && cp "$HOME/BANNER-X/files/font.ttf" "$ox"
    [ ! -f "$simu" ] && cp "$HOME/BANNER-X/files/colors.properties" "$ox"
   
    # def & art
    mkdir -p "$HOME/.bannerx/def"
    mkdir -p "$HOME/.bannerx/art"
    def="$HOME/.bannerx/def"
    art="$HOME/.bannerx/art"
    
    [ ! -f "$def" ] && cp "$HOME/BANNER-X/files/font.ttf" "$def"
    [ ! -f "$def" ] && cp "$HOME/BANNER-X/files/colors.properties" "$def"
    
    [ ! -f "$art" ] && cp "$HOME/BANNER-X/files/art/art1" "$art"
    [ ! -f "$art" ] && cp "$HOME/BANNER-X/files/art/art2" "$art"
    
    mv "$HOME/BANNER-X/files/chat" "$PREFIX/bin/" && chmod +x "$PREFIX/bin/chat"
    mv "$HOME/BANNER-X/files/codecat" "$PREFIX/bin/" && chmod +x "$PREFIX/bin/codecat"
   
    mv "$HOME/BANNER-X/files/uninstall" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/uninstall"
    mv "$HOME/BANNER-X/files/bannerx" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/bannerx"
    mv "$HOME/BANNER-X/files/bname" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/bname"
    mv "$HOME/BANNER-X/files/simu" "$PREFIX/bin/" && chmod +x "$PREFIX/bin/simu"
    mv "$HOME/BANNER-X/files/dev" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/dev"
    mv "$HOME/BANNER-X/files/update" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/update"
    mv "$HOME/BANNER-X/files/help" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/help"
    mv "$HOME/BANNER-X/files/code" "$PREFIX/bin/" && chmod +x "$PREFIX/bin/code"
    chsh -s zsh >/dev/null 2>&1 &
    termux-reload-settings
}

setup_linux_paths() {

    # def & art
    mkdir -p "$HOME/.bannerx/def"
    mkdir -p "$HOME/.bannerx/art"
    def1="$HOME/.bannerx/def"
    art1="$HOME/.bannerx/art"
    
    [ ! -f "$def1" ] && cp "$HOME/BANNER-X/files/font.ttf" "$def1"
    
    [ ! -f "$art1" ] && cp "$HOME/BANNER-X/files/art/art1" "$art1"
    [ ! -f "$art1" ] && cp "$HOME/BANNER-X/files/art/art2" "$art1"

    su=""
    [ "$(id -u)" -ne 0 ] && su="sudo"
    mkdir -p "$HOME/.bannerx"
    mkdir -p "$HOME/.local/share/fonts"
    cp "$HOME/BANNER-X/files/font.ttf" "$HOME/.local/share/fonts/"
    command -v fc-cache >/dev/null 2>&1 || $su apt-get install -y fontconfig >/dev/null 2>&1 </dev/null
    command -v fc-cache >/dev/null 2>&1 && fc-cache -f >/dev/null 2>&1
   
   
    $su mv "$HOME/BANNER-X/files/chat" "/usr/local/bin/" && $su chmod +x "/usr/local/bin/chat"
    $su mv "$HOME/BANNER-X/files/codecat" "/usr/local/bin/" && $su chmod +x "/usr/local/bin/codecat"
   
    mv "$HOME/BANNER-X/files/uninstall" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/uninstall"
    mv "$HOME/BANNER-X/files/bannerx" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/bannerx"
    mv "$HOME/BANNER-X/files/bname" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/bname"
    mv "$HOME/BANNER-X/files/dev" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/dev"
    $su mv "$HOME/BANNER-X/files/simu" "/usr/local/bin/" && $su chmod +x "/usr/local/bin/simu"
    mv "$HOME/BANNER-X/files/update" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/update"
    mv "$HOME/BANNER-X/files/help" "$HOME/.bannerx/" && chmod +x "$HOME/.bannerx/help"
    $su mv "$HOME/BANNER-X/files/code" "/usr/local/bin/" && $su chmod +x "/usr/local/bin/code"
}

dxnetcheck() {
    clear
    echo
    echo -e "                     ${g}Uhu"
    echo -e "${c}                        (\_/)"
    echo -e "                        (${y}^_^${c})"
    echo -e "                       ⊂(___)づ"
    echo
    echo -e "                ${g}╔════════════════╗"
    echo -e "                ${g}║ ${n}</>  ${c}BANNERX${g}   ║"
    echo -e "                ${g}╚════════════════╝"
    echo -e "  ${g}╔════════════════════════════════════════════╗"
    echo -e "  ${g}║  ${y} Checking Your Internet Connection¡ ${g}      ║"
    echo -e "  ${g}╚════════════════════════════════════════════╝${n}"
    while true; do
        curl --silent --head --fail https://github.com > /dev/null
        if [ "$?" != 0 ]; then
            echo -e "              ${g}╔══════════════════╗"
            echo -e "              ${g}║${C} ${r}No Internet ${g}║"
            echo -e "              ${g}╚══════════════════╝"
            sleep 2.5
        else
            break
        fi
    done
    clear
}

sync_id() {
local BANNERX="https://bannerx-server-mauve.vercel.app"
UPDATE_LOG="$HOME/.bannerx_update_id.txt"
    if command -v curl >/dev/null 2>&1 && command -v jq >/dev/null 2>&1; then
        local sid=$(curl -s --connect-timeout 5 "${BANNERX}/update" 2>/dev/null | jq -r '.id' 2>/dev/null | tr -d '[:space:]')
        [ -n "$sid" ] && [ "$sid" != "null" ] && echo "$sid" > "$UPDATE_LOG"
    fi
}

donotchange() {
    clear
    echo
    echo
    echo -e ""
    echo -e "${c}              (\_/)"
    echo -e "              (${y}^_^${c})     ${A} ${g}Hey dear${c}"
    echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
    echo
    echo -e " ${A} ${c}Please Enter Your ${g}Banner Name${c}"
    echo
    while true; do
        read -p "$(echo -e "${c}${A}──[Enter Your Name]────► ${n}")" name
        echo
       
        if [[ -z "$name" ]]; then
            echo -e " ${E} ${r}Name cannot be empty!${c}"
            echo
            continue
        fi
       
        if [[ ! "$name" =~ ^[a-zA-Z0-9[:space:]-]+$ ]]; then
            echo -e " ${E} ${r}Invalid Input! No fancy fonts or symbols.\n ${E} ${r}Use letters, numbers, hyphens & spaces only.${c}"
            echo
            continue
        fi

        name="${name^^}"
        name="${name// /-}"

        len=${#name}
        if [[ $len -ge 1 && $len -le 8 ]]; then
            break
        else
            echo -e " ${E} ${r}Name must be between ${g}1 and 8${r} characters.\n ${y}Current length is: ${g}$len${c}"
            echo
        fi
    done

    if [ -d "/data/data/com.termux/files/usr/" ]; then
        _P="${PREFIX:-/data/data/com.termux/files/usr}"
        for _f in motd motd.sh; do
            [ -f "$_P/etc/$_f" ] && mv -f "$_P/etc/$_f" "$HOME/.BANNER-X/$_f" 2>/dev/null
        done
        D1="$HOME/.termux"
    else
        D1="$HOME/.BANNER-X"
    fi
   
    
    mkdir -p "$D1"

    USERNAME_FILE="$D1/usernames.txt"
    INPUT_FILE="$HOME/BANNER-X/files/.zshrc"
    THEME_INPUT="$HOME/BANNER-X/files/.bannerx.zsh-theme"
    OUTPUT_ZSHRC="$HOME/.zshrc"
    OUTPUT_THEME="$HOME/.oh-my-zsh/themes/bannerx.zsh-theme"
    TEMP_FILE="$HOME/temp.zshrc"
   
    sed "s/DX-SIMU/$name/g" "$INPUT_FILE" > "$TEMP_FILE" &&
    sed "s/DX-SIMU/$name/g" "$THEME_INPUT" > "$OUTPUT_THEME"
 
    if [[ $? -eq 0 ]]; then
        mv "$TEMP_FILE" "$OUTPUT_ZSHRC"
        
        
        echo "$name" > "$USERNAME_FILE"
        
        clear
        echo
        echo
        echo -e "               ${g}Hey ${y}$name"
        echo -e "${c}              (\_/)"
        echo -e "              (${y}^ω^${c})     ${g}I'm Bannerx${c}"
        echo -e "             ⊂(___)づ  ⋅˚₊‧ ଳ ‧₊˚ ⋅"
        echo
        echo -e " ${A} ${c}Your Banner created ${g}Successfully¡${c}"
        echo
        sleep 1
        sync_id
    else
        echo
        echo -e " ${E} ${r}Error occurred while processing the file."
        sleep 1
        rm -f "$TEMP_FILE"
    fi
    clear
}

banner() {
    clear
    echo
    echo
    echo -e "   ${y}░█████╗░░█████╗░██████╗░███████╗██╗░░██╗"
    echo -e "   ${y}██╔══██╗██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝"
    echo -e "   ${y}██║░░╚═╝██║░░██║██║░░██║█████╗░░░╚███╔╝░"
    echo -e "   ${c}██║░░██╗██║░░██║██║░░██║██╔══╝░░░██╔██╗░"
    echo -e "   ${c}╚█████╔╝╚█████╔╝██████╔╝███████╗██╔╝╚██╗"
    echo -e "   ${c}░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═╝░░╚═╝${n}"
    echo -e "${y}               +-+-+-+-+-+-+-+-+"
    echo -e "${c}               |O|X|-|C|O|D|E|X|"
    echo -e "${y}               +-+-+-+-+-+-+-+-+${n}"
    echo
    if [ $random_number -eq 0 ]; then
        echo -e "${b}╭════════════════════════⊷"
        echo -e "${b}┃ ${g}[${n}ム${g}] ᴛɢ: ${y}t.me/Termuxbannerx"
        echo -e "${b}╰════════════════════════⊷"
    else
        echo -e "${b}╭══════════════════════════⊷"
        echo -e "${b}┃ ${g}[${n}ム${g}] ᴛɢ: ${y}t.me/alphabannerx369"
        echo -e "${b}╰══════════════════════════⊷"
    fi
    echo
    echo -e "${b}╭══ ${g}${D} ${y}ᴄᴏᴅᴇx ${g}${D}"
    echo -e "${b}┃❁ ${g}ᴄʀᴇᴀᴛᴏʀ: ${y}ᴅx-ᴄᴏᴅᴇx"
    echo -e "${b}┃❁ ${g}ᴅᴇᴠɪᴄᴇ: ${y}${VENDOR} ${MODEL}"
    echo -e "${b}╰┈➤ ${g}Hey ${y}Dear"
    echo
}

setupx() {
    tr
    dxnetcheck
    banner                                                                              
    echo -e " ${C} ${y}Detected System Setup¡"
    echo -e " ${lm}"
    echo -e " ${A} ${g}Updating Package..¡"
    echo -e " ${dm}"
    echo -e " ${A} ${g}Wait a few minutes.${n}"
    echo -e " ${lm}"

    spin "purge_legacy"

    $SUDO dpkg --configure -a >/dev/null 2>&1 </dev/null
    run_job 'Update pkgs' spin update || { echo -e "${E} Update failed. Check internet/mirror.${n}"; FAILED+=("update"); }
    run_job 'Upgrade pkgs' spin upgrade || echo -e "${D} Upgrade skipped, continuing.${n}"

    command -v tput >/dev/null 2>&1 || {
        if ((IS_TERMUX)); then spin "pkg" ncurses-utils; else spin "pkg" ncurses-bin; fi
    }

    if ((IS_TERMUX)); then
        packages=(git python ncurses-utils jq figlet termux-api lsd zsh ruby eza)
    else
        packages=(git python3 python3-pip ncurses-bin jq figlet lsd zsh ruby eza)
    fi

    for w in "${packages[@]}"; do
        installed "$w" && continue
        spin "pkg" "$w" || {
            pm update >/dev/null 2>&1 </dev/null
            spin "pkg" "$w" || FAILED+=("$w")
        }
    done

    hash -r
    

    mkdir -p "$HOME/.bannerx"

    spin "git_clone" "https://github.com/ohmyzsh/ohmyzsh.git" "$HOME/.oh-my-zsh" || FAILED+=("oh-my-zsh")
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        spin "git_clone" "https://github.com/zsh-users/zsh-autosuggestions" "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions" || FAILED+=("zsh-autosuggestions")
        spin "git_clone" "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting" || FAILED+=("zsh-syntax-highlighting")
    fi

    if [ -d "$HOME/BANNER-X" ]; then
        sleep 2
        clear
        banner
        echo -e " ${A} ${p}Updating Completed...!¡"
        echo -e " ${dm}"
        clear
        banner
        echo -e " ${C} ${c}Package Setup Your System..${n}"
        echo
        echo -e " ${A} ${g}Wait a few minutes.${n}"
       
        if [ -d "/data/data/com.termux/files/usr/" ]; then
            setup_termux_paths
        else
            setup_linux_paths
        fi
       
        donotchange
        clear
        banner
        echo -e " ${C} ${c}Type ${g}exit ${c} then ${g}enter ${c}Now Open Your Terminal${n}"
        echo
        sleep 3
        cd "$HOME"
        rm -rf "$HOME/BANNER-X"
        kill -9 $PPID 2>/dev/null
        exit 0
    else
        clear
        banner
        echo -e " ${E} ${r}Tools Not Exits Your Terminal.."
        echo
        echo
        sleep 3
        exit
    fi
}

banner2() {
    echo
    echo
    echo -e "   ${y}░█████╗░░█████╗░██████╗░███████╗██╗░░██╗"
    echo -e "   ${y}██╔══██╗██╔══██╗██╔══██╗██╔════╝╚██╗██╔╝"
    echo -e "   ${y}██║░░╚═╝██║░░██║██║░░██║█████╗░░░╚███╔╝░"
    echo -e "   ${c}██║░░██╗██║░░██║██║░░██║██╔══╝░░░██╔██╗░"
    echo -e "   ${c}╚█████╔╝╚█████╔╝██████╔╝███████╗██╔╝╚██╗"
    echo -e "   ${c}░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═╝░░╚═╝${n}"
    echo -e "${y}               +-+-+-+-+-+-+-+-+"
    echo -e "${c}               |O|X|-|C|O|D|E|X|"
    echo -e "${y}               +-+-+-+-+-+-+-+-+${n}"
    echo
    if [ $random_number -eq 0 ]; then
        echo -e "${b}╭════════════════════════⊷"
        echo -e "${b}┃ ${g}[${n}ム${g}] ᴛɢ: ${y}t.me/Termuxbannerx"
        echo -e "${b}╰════════════════════════⊷"
    else
        echo -e "${b}╭══════════════════════════⊷"
        echo -e "${b}┃ ${g}[${n}ム${g}] ᴛɢ: ${y}t.me/alphabannerx369"
        echo -e "${b}╰══════════════════════════⊷"
    fi
    echo
    echo -e "${b}╭══ ${g}${D} ${y}ᴄᴏᴅᴇx ${g}${D}"
    echo -e "${b}┃❁ ${g}ᴄʀᴇᴀᴛᴏʀ: ${y}ᴅx-ᴄᴏᴅᴇx"
    echo -e "${b}╰┈➤ ${g}Hey ${y}Dear"
    echo
    echo -e "${c}╭════════════════════════════════════════════════⊷"
    echo -e "${c}┃ ${p}❏ ${g}Choose what you want to use. then Click Enter${n}"
    echo -e "${c}╰════════════════════════════════════════════════⊷"
}

options=("Free Usage" "Premium")
selected=0

display_menu() {
    clear
    banner2
    echo
    echo -e " ${g}■ \e[4m${p}Select An Option\e[0m ${g}▪${n}"
    echo
    for i in "${!options[@]}"; do
        if [ $i -eq $selected ]; then
            echo -e " ${g}${D}> ${c}${options[$i]} ${g}<${D}${n}"
        else
            echo -e "     ${options[$i]}"
        fi
    done
}

if [ -d "/data/data/com.termux/files/usr/" ]; then
    clear

    box=(
        " ${p}❐${n} \e[4m${g}Use Button${n}\e[0m ${p}❏${n}"
        ""
        " ${y}Termux: Use Extra key Button with move${n}"
        ""
        "${c}⿻${n} UP          ↑"
        "${c}⿻${n} DOWN        ↓"
        ""
        " ${g}Select option Click Enter button${n}"
        ""
        " ${b}〄${n} \e[1;36mIf you understand, click the Enter Button\e[0m ${b}"
    )

    rows=${#box[@]}
    cols=$(tput cols)
    lines=$(tput lines)

    # Center block vertically
    top=$(( (lines - rows) / 2 ))
    ((top < 0)) && top=0

    tput cup "$top" 0

    for line in "${box[@]}"; do
        # Remove ANSI codes
        clean=$(printf '%b' "$line" | sed $'s/\033\\[[0-9;]*m//g')
        len=${#clean}

        # Center line horizontally
        left=$(( (cols - len) / 2 ))
        ((left < 0)) && left=0

        printf "%*s%b\n" "$left" "" "$line"
    done

    read -r
    clear
fi

while true; do
    display_menu

    read -rsn1 input

    if [[ "$input" == $'\x1b' || "$input" == $'\e' ]]; then
        read -rsn2 -t 0.05 input2
        input+="$input2"
    fi

    case "$input" in
        $'\x1b[A' | $'\e[A') # Up
            ((selected--))
            ((selected < 0)) && selected=$((${#options[@]} - 1))
            ;;

        $'\x1b[B' | $'\e[B') # Down
            ((selected++))
            ((selected >= ${#options[@]})) && selected=0
            ;;

        "")
            case ${options[$selected]} in
                # Other options stay here
            esac
            ;;
    esac
done