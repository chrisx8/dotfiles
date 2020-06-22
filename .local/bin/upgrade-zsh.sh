#!/bin/bash
set -e

P10K="$ZSH/custom/themes/powerlevel10k"
if [[ ! -d "$ZSH" ]] || [[ ! -d "$P10K" ]]; then
	echo "Cannot find Oh My ZSH installation."
	return 1
fi

echo '##### Updating Oh My ZSH... #####'
zsh "$ZSH/tools/upgrade.sh"
echo -e '\n##### Updating p10k... #####'
curdir=$(pwd)
cd "$P10K"
git pull
cd "$curdir"
