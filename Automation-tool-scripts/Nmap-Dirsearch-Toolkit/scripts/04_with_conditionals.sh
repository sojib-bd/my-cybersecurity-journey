#!/usr/bin/bash

PATH_TO_DIRSEARCH="/usr/local/bin/dirsearch"
TODAY=$(date)
echo "This scan was created on $TODAY"
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
echo "Creating direcotry $DIRECTORY."
mkdir $DIRECTORY
if [ $2 == "nmap-only" ]; 
then
        nmap $DOMAIN > $DIRECTORY/nmap
        echo "The result of nmap scan are stored in $DIRECTORY/nmap"
elif [ $2 == "dirsearch-only" ];
then
        $PATH_TO_DIRSEARCH -u $DOMAIN -e php --output=$DIRECTORY/dirsearch
        echo "The result of dirsearch scan are stored in $DIRECTORY/dirsearch."
else
        nmap $DOMAIN > $DIRECTORY/nmap
        echo "The result of nmap scan are stored in $DIRECTORY/nmap"
        $PATH_TO_DIRSEARCH -u $DOMAIN -e php --output=$DIRECTORY/dirsearch
        echo "The result of dirsearch scan are stored in $DIRECTORY/dirseach"
fi
