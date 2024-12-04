#!/usr/bin/bash

PATH_TO_DIRSEARCH="/usr/local/bin/dirsearch"
TODAY=$(date)
echo "The scan was created on $TODAY"
DOMAIN=$1
DIRECTORY=${DOMAIN}_RECON
echo "Creating directory $DIRECTORY" 
mkdir $DIRECTORY 
case $2 in
        nmap-only)
        nmap -sV -Pn $DOMAIN > $DIRECTORY/nmap
        echo "The result of nmap scan is stored in $DIRECTORY/nmap"
        ;;
        dirsearch-only)
        $PATH_TO_DIRSEARCH -u $DOMAIN -e php --output=$DIRECTORY/dirsearch
        echo "The result of dirsearch is stored in $DIRECTORY/dirsearch"
        ;;
        crt-only)
        curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
        echo "The result of crt scan is stored in $DIRECTORY/crt"
        ;;
        *)
        nmap -sV -Pn $DOMAIN > $DIRECTORY/nmap
        echo "The result of nmap scan is stored in $DIRECTORY/nmap"
        $PATH_TO_DIRSEARCH -u $DOMAIN -e php --output=$DIRECTORY/dirsearch
        echo "The result of dirsearch is stored in $DIRECTORY/dirsearch"
        curl "https://crt.sh/?q=$DOMAIN&output=json" -o $DIRECTORY/crt
        echo "The result of crt scan is stored in $DIRECTORY/crt"
        ;;
esac
