#!/bin/bash

# Variables
opt=""
ipServer=""
serverPort="35777" # If not set, starting with default value
nickname="anonymous"

run () {
  printf "Starting server... "
  sleep 3 && printf "OK!\n" && sleep 1
  echo "+===========================+"
  echo "|  TERMINAL SERVER STARTED  |"
  echo "+===========================+"
  echo ""
  echo " - Press 'Ctrl + C' to exit."
  echo ""

  if [[ $1 -eq 0 ]]; then
    mawk -W interactive '$0="'${nickname}': " $0' | nc -l -p ${serverPort} ${ipServer}
  else
    mawk -W interactive '$0="'${nickname}': " $0' | nc ${ipServer} ${serverPort}
  fi
}

menu () {
  while true
  do
  clear
  echo "================================================"
  echo "A Simple chat using terminal"
  echo "Builded for: Everton Gonçalves"
  echo "Github: @dsgeverton"
  echo ""
  echo "1) New Server Chat"
  echo ""
  echo "2) Sign In a Chat"
  echo ""
  echo "0) Exit"
  echo ""
  echo "================================================"

  echo "Option: "
  read opt
  echo "Setted option: ($opt)"
  echo "================================================"

  case "$opt" in

      1)
        # echo "Trying get your IP address..."
        # sip="/tmp/sip"
        # aux="/tmp/aux"
        # ifconfig > $sip
        # cat $sip | awk 'NR>=2 && NR<=2' > $aux
        # show="`cat $aux | awk '{print $3}'`"
        # rm $aux |rm $sip
        # echo "$show"
        echo "Entry your IP address: "
        read ipServer

        echo "Entry your nickname: "
        read nickname
        run "0"

  echo "================================================"
  ;;
      2)
        echo "Entry server IP address: "
        read ipServer

        echo "Entry your nickname: "
        read nickname
        run "1"

  echo "================================================"
  ;;
      0)
        echo "Exiting..."
        sleep 3
        clear;
        exit;
  echo "================================================"
  ;;

  *)
        echo "Invalid Option!"
esac
done

}
menu
