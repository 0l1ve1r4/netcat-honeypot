#!/bin/bash

SSH_PORT=22

HONEY_POT="./fakessh.sh"
LOG_FILE="./log/honeypot.log"


if [ "$EUID" -ne 0 ]
  then echo "[ERROR]: Please run as root"
  exit
fi

start_server(){
    echo "" >> "$LOG_FILE" && nc -l -p $SSH_PORT -e $HONEY_POT -v 2>> "$LOG_FILE"
}

echo "├── Starting server with PID: [$$] - Kill it to stop" >> "$LOG_FILE"

while true; do

    start_server

done
