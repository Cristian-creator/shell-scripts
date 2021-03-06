#!/bin/bash

####  CONSTANTS ####
DELAY=3
GREEN=`tput setaf 2`
RED=`tput setaf 1`
RESET=`tput sgr0`
####################

while true; do
  clear
  echo "${GREEN}Welcome, $USER!${RESET}"
  cat << _EOF_
Select Display:

1. System Information
2. Disk Space
3. Package Updates
4. CPU/Memory Usage
0. Quit

_EOF_

  read -p "Enter selection [0-4] > "

  if [[ $REPLY =~ ^[0-4]$ ]]; then
   case $REPLY in
      1)
        echo "Hostname: $HOSTNAME"
        uptime
        sleep $DELAY
        continue
        ;;
      2)
        df -h
        sleep $DELAY
        continue
        ;;
      3)
	cat /var/lib/update-notifier/updates-available | head -3
        sleep $DELAY
        continue
        ;;
      4)
	echo -e "###### Memory usage ######"
	cat /proc/meminfo | head -5
	echo -e "\n"

	echo -e "###### Swap Usage ######"
	free
	echo -e "\n"

	echo "###### CPU Usage: ######"
	cat /proc/stat | grep cpu
	echo ""
	sleep $DELAY
	continue
	;;
	 0)
        break
        ;;
    esac
  else
    echo "${RED}Invalid entry.${RESET}"
    sleep $DELAY
  fi
done
echo -e "Program terminated."

