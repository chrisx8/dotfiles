#!/bin/bash

BASE_DIR="/tmp/home-$USER"

DIRS="
.cache
.config/Code*-*OSS/Cache
.config/Code*-*OSS/CachedData
.config/Code*-*OSS/CachedExtensions
.config/Code*-*OSS/Code*Cache
.config/Code*-*OSS/GPUCache
.config/Code*-*OSS/logs
.config/session
.config/Signal/Code*Cache
.config/Signal/GPUCache
.config/Signal/logs
.config/Signal/temp
"

if [[ -d "$BASE_DIR" ]]; then
	echo "$BASE_DIR already exists"
	exit 1
fi

mkdir -p -m 700 "$BASE_DIR"

for DIR in $DIRS; do
	DIR=$(echo "$DIR" | sed 's/*/ /g')
	echo "Creating $BASE_DIR/$DIR"
	mkdir -p -m 700 "$BASE_DIR/$DIR"
	if [[ !  -L "/$HOME/$DIR" ]]; then
		echo "Linking $BASE_DIR/$DIR to $HOME"
		ln -s "$BASE_DIR/$DIR" "$HOME/$DIR"
	fi
done
exit 0
