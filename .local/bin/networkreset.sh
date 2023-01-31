#!/bin/bash
set -e

if [[ "$*" = "--config" ]]; then
	echo "Please disconnect from VPNs before continuing."
	read -r -p "Press Enter to continue..."
	echo
fi
sudo -v

echo "Resetting DNS..."
sudo rm -f /etc/resolv.conf.*
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
sudo systemctl enable systemd-resolved.service
sudo systemctl restart systemd-resolved.service

echo "Enabling IPv6..."
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0 > /dev/null

echo "Restarting NetworkManager..."
sudo systemctl restart NetworkManager.service

echo "OK"
