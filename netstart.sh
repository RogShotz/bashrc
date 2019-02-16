#!/bin/bash

arr=( $(ls /etc/netctl -p | grep -v /) )
returnValue=0
number=0
flag=$1
YELLOW='\033[1;33m'
NC='\033[0m'

fileAmount () {
  find "/etc/netctl/" -maxdepth 1 -type f | wc -l
  return $?
}

netstop() {
  if [[ "${flag}" == *"n"* ]];
  then
      if [[ "${flag}" == *"v"* ]];
      then
        echo -e "${YELLOW}stop-all not ran${NC}"
      fi
  else
  sudo netctl stop-all
    if [[ "${flag}" == *"v"* ]];
    then
      echo -e "${YELLOW}stop-all ran${NC}"
    fi
fi
}

list () {
  for ((i=1; i <= $(fileAmount); i++))
    do
      echo "(${i}) ${arr[$i - 1]}"
    done
    }

pick () {
  printf "Pick a wifi "
  read number
  # use this for -v flag echo "sudo netctl start "${arr[$number -1]}""
  sudo netctl start "${arr[$number - 1]}"
          if [[ "${flag}" == *"v"* ]];
      then 
        echo -e "${YELLOW}sudo netctl start "${arr[$number - 1]}"${NC}"
      fi 
}

netstop
list
pick
