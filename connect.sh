#!/bin/bash

# Prevent running as root
if [ "$EUID" -eq 0 ]; then
    echo "Error: Do not run this script with 'sudo'. Please run it as a normal user."
    exit 1
fi

# Trap Ctrl+C to simulate old-school exit
trap ctrl_c INT

ctrl_c() {
    echo ""
    echo "gilfoyle@friday:~$ ^C"
    sleep 0.5
    echo "gilfoyle@friday:~$ "
    exit 0
}

# A function to display the retro terminal menu
show_menu() {
    clear
    echo "====================================================="
    echo "              Welcome to My 90s Terminal"
    echo "====================================================="
    echo "Use UP/DOWN arrows (or W/S) and ENTER to select."
    echo "====================================================="
    echo "1) Portfolio"
    echo "2) Blog"
    echo "3) LinkedIn"
    echo "4) Twitter"
    echo "====================================================="
}

# List of your URLs (replace with your real links)
portfolio_url="https://terminal.utkarshlabs.tech"
blog_url="https://utkarshlabs.tech"
linkedin_url="https://www.linkedin.com/in/utkarsh-maurya-connect/"
twitter_url="https://x.com/gilfoyle_v2"

selection=1

open_link() {
    case $selection in
        1) echo "Opening Portfolio..." && sleep 1 && xdg-open "$portfolio_url" ;;
        2) echo "Opening Blog..." && sleep 1 && xdg-open "$blog_url" ;;
        3) echo "Opening LinkedIn..." && sleep 1 && xdg-open "$linkedin_url" ;;
        4) echo "Opening Twitter..." && sleep 1 && xdg-open "$twitter_url" ;;
        *) echo "Invalid selection." ;;
    esac
}

# Main menu loop
while true; do
    show_menu
    echo "Selection: $selection"
    echo ""
    echo -n "gilfoyle@friday:~$ "

    # Read key press
    read -rsn1 key  # Read 1 char without Enter
    if [[ $key == $'\x1b' ]]; then
        read -rsn2 key  # Read extra 2 bytes for arrow keys
        if [[ $key == "[A" ]]; then
            ((selection--))
            if [ $selection -lt 1 ]; then selection=4; fi
        elif [[ $key == "[B" ]]; then
            ((selection++))
            if [ $selection -gt 4 ]; then selection=1; fi
        fi
    elif [[ $key == "w" || $key == "W" ]]; then
        ((selection--))
        if [ $selection -lt 1 ]; then selection=4; fi
    elif [[ $key == "s" || $key == "S" ]]; then
        ((selection++))
        if [ $selection -gt 4 ]; then selection=1; fi
    elif [[ $key == "" ]]; then
        open_link
        break
    fi
done
