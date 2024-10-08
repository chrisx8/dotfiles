#!/bin/bash
set -e

if [ "$(uname -s)" != "Darwin" ]; then
    echo "This should only be used on MacOS!"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Usage: mkicns.sh input.png"
    exit 1
fi

mkdir "$1.iconset"
sips -z 16 16 "$1" --out "$1.iconset"/icon_16x16.png
sips -z 32 32 "$1" --out "$1.iconset"/icon_16x16@2x.png
sips -z 32 32 "$1" --out "$1.iconset"/icon_32x32.png
sips -z 64 64 "$1" --out "$1.iconset"/icon_32x32@2x.png
sips -z 128 128 "$1" --out "$1.iconset"/icon_128x128.png
sips -z 256 256 "$1" --out "$1.iconset"/icon_128x128@2x.png
sips -z 256 256 "$1" --out "$1.iconset"/icon_256x256.png
sips -z 512 512 "$1" --out "$1.iconset"/icon_256x256@2x.png
sips -z 512 512 "$1" --out "$1.iconset"/icon_512x512.png
cp "$1" "$1.iconset"/icon_512x512@2x.png
iconutil -c icns "$1.iconset"
rm -R "$1.iconset"
