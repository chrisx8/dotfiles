#!/bin/bash
set -e

sudo clevis luks bind -d /dev/nvme0n1p2 tpm2 '{"pcr_ids":"0,2,7"}'
#sudo systemd-cryptenroll /dev/nvme0n1p2 --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrs=0,2,4,7
