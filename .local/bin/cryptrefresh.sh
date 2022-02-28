#!/bin/bash

sudo systemd-cryptenroll --wipe-slot=tpm2 --tpm2-device=auto --tpm2-pcrs=0+2+4+7 /dev/nvme0n1p2
