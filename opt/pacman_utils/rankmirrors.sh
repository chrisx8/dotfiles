#!/bin/bash
set -e

read -p "Enter an ISO country code: " COUNTRY
read -p "Use https? (y/n) " USE_HTTPS
if [[ "$USE_HTTPS" == "y" ]]; then
    PROTO="https"
elif [[ "$USE_HTTPS" == "n" ]]; then
    PROTO="http"
else
    echo "Invalid input!"
    exit 1
fi

echo -e "\nDownloading mirror list..."
curl -o /tmp/mirrorlist_dl "https://www.archlinux.org/mirrorlist/?country=$COUNTRY&protocol=$PROTO&use_mirror_status=on"
sed -i /tmp/mirrorlist_dl -e "s/^#Server/Server/" -e "/^#/d"

echo
read -p "Rank mirrors? (y/n) " RANK
if [[ "$RANK" == "y" ]]; then
    rankmirrors -n 5 /tmp/mirrorlist_dl > /tmp/mirrorlist
elif [[ "$RANK" == "n" ]]; then
    head -n 5 /tmp/mirrorlist_dl > /tmp/mirrorlist
else
    echo "Invalid input!"
    rm /tmp/mirrorlist_dl
    exit 1
fi
rm /tmp/mirrorlist_dl

echo
read -p "Write to disk? (y/n)" WRITE
if [[ "$WRITE" == "y" ]]; then
	echo -e "\nWriting mirror list..."
	sudo mv /tmp/mirrorlist /etc/pacman.d/mirrorlist
	echo "OK"
else
	cat /tmp/mirrorlist
	rm /tmp/mirrorlist
fi
