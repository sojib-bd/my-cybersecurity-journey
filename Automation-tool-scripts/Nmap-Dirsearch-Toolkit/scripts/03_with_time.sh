#!/usr/bin/bash

PATH_TO_DIRSEARCH="/usr/local/bin/dirsearch"
TODAY=$(date)
echo "This scan was created on $TODAY"
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
echo "Creating directory $DIRECTORY."
mkdir $DIRECTORY
nmap $DOMAIN > $DIRECTORY/nmap
echo "The result of nmap scan are stored in $DIRECTORY/nmap."
$PATH_TO_DIRSEARCH -u $DOMAIN -e php --output=$DIRECTORY/dirsearch
echo "The result of dirsearch scan are stored in $DIRECTORY/dirsearch."
