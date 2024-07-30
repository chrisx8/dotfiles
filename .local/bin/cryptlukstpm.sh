#!/bin/bash
set -eux
LUKSBLKDEV=/dev/nvme0n1p3

if [ "$(uname -s)" != "Linux" ]; then
    echo "This should only be used on Linux!"
    exit 1
fi

sudo systemd-cryptenroll "$LUKSBLKDEV" \
    --tpm2-device=auto \
    --tpm2-pcrs=0,2,4,7 \
    --tpm2-with-pin=true \
    --wipe-slot=tpm2
