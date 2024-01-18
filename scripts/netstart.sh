#!/bin/bash

arr=( $(ls /etc/netctl -p | grep -v /) )
returnValue=0
number=0
flag=$1
rfNumber=0
YELLOW='\033[1;33m'
NC='\033[0m'

arguements () {
    if [[ "${flag}" == *"h"* ]];
    then
        echo "n, Does not run netctl stop-all"
        echo "q, Runs in quiet mode"
        echo "s, Skips netctl wait-online"
        echo "r, Runs RFKill to fix blocked devices"
        exit
    fi
}

fileAmount () {
    find "/etc/netctl/" -maxdepth 1 -type f | wc -l
    return $?
}

netstop() {
    if [[ "${flag}" != *"n"* ]];
    then
        if [[ "${flag}" != *"q"* ]];
        then
            echo -e "${YELLOW}sudo netctl stop-all${NC}"
        fi
    sudo netctl stop-all
    else
        echo -e "${YELLOW}stop-all not run${NC}"
    fi
}

list () {
    for ((i=1; i <= $(fileAmount); i++))
    do
        echo "(${i}) ${arr[$i - 1]}"
    done
}

pick () {
    echo ""
    printf "Select a wifi: "
    read number
    if [[ "${flag}" != *"q"* ]]; 
    then
        echo -e "${YELLOW}sudo netctl start "${arr[$number - 1]}"${NC}"
    fi
    sudo netctl start "${arr[$number - 1]}"
}

waitOnline() {
    if [[ "${flag}" != *"q"* ]]; 
    then
        if [[ "${flag}" == *"s"* ]];
        then
            echo -e "${YELLOW}wait-online skipped${NC}"
        else
            echo -e "${YELLOW}sudo netctl wait-online ${arr[$number - 1]}${NC}"
            sudo netctl wait-online "${arr[$number - 1]}"
        fi
    elif [[ "${flag}" != *"s"* ]];
    then
        sudo netctl wait-online "${arr[$number -1 ]}"
    fi
}

RFKill() {
    if [[ "${flag}" == *"r"* ]];
    then
        if [[ "${flag}" != *"q"* ]];
        then
            echo -e "${YELLOW}rfkill${NC}"
            sudo rfkill
                echo "Which ID would you like to unblock?"
                read rfNumber
                echo -e "${YELLOW}sudo rfkill unblock "${rfNumber}${NC}""
                sudo rfkill unblock "${rfNumber}"
        else
                sudo rfkill
                echo "Which ID would you like to unblock?"
                read rfNumber
                sudo rfkill unblock "${rfNumber}"
        fi
    fi
}

RFKill
arguements
netstop
list
pick
waitOnline
