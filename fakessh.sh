#!/bin/bash

LOG_FILE="./log/honeypot.log"
BANNER="SSH-2.0-OpenSSH_8.6p1 Ubuntu-6ubuntu0.1"

log_attempt() {
    local username="$2"
    local password="$3"
    echo "└─[$(date)]: USER: $username | PASSWORD | $password" >> "$LOG_FILE"
}


main(){
    echo "$BANNER"

    echo -n "login: "
    read -r username
    echo -n "password: "
    read -s password
    echo

    log_attempt "$attacker_ip" "$username" "$password"

    echo "Access denied"
}

main