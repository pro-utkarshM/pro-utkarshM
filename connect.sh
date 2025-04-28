#!/bin/bash

show_menu() {
    clear
    echo "====================================================="
    echo "              Welcome to My 90s Terminal"
    echo "====================================================="
    echo "Use UP/DOWN arrows to navigate and ENTER to select."
    echo "====================================================="
    echo "1) Portfolio"
    echo "2) Blog"
    echo "3) LinkedIn"
    echo "4) X/Twitter"
    echo "====================================================="
}

# List of URLs
portfolio_url="https://terminal.utkarshlabs.tech/"
blog_url="https://utkarshlabs.tech/"
linkedin_url="https://www.linkedin.com/in/utkarsh-maurya-connect/"
twitter_url="https://x.com/gilfoyle_v2"

selection=1

open_link() {
    case $selection in
        1) 
            echo "Opening Portfolio..."; 
            sleep 1;
            xdg-open "$portfolio_url" ;;
        2) 
            echo "Opening Blog..."; 
            sleep 1;
            xdg-open "$blog_url" ;;
        3) 
            echo "Opening LinkedIn..."; 
            sleep 1;
            xdg-open "$linkedin_url" ;;
        4) 
            echo "Opening Twitter..."; 
            sleep 1;
            xdg-open "$twitter_url" ;;
        *) 
            echo "Invalid selection." ;;
    esac
}

while true; do
    show_menu
    echo "Selection: $selection"
    echo ""
    echo "gilfoyle@friday:~$ "

    read -n 1 -s key

    # Navigation logic
    if [[ "$key" == "A" ]] || [[ "$key" == "w" ]]; then
        # Up key (Arrow Up or "w")
        ((selection--))
        if [ $selection -lt 1 ]; then
            selection=4
        fi
    elif [[ "$key" == "B" ]] || [[ "$key" == "s" ]]; then
        # Down key (Arrow Down or "s")
        ((selection++))
        if [ $selection -gt 4 ]; then
            selection=1
        fi
    elif [[ "$key" == "" ]]; then
        # Enter key (to select)
        open_link
        break
    fi
done

echo "gilfoyle@friday:~$ ^C"
sleep 1
echo "gilfoyle@friday:~$ "
