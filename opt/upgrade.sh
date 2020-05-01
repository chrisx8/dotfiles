#!/bin/bash
set -e

function upgrade_zsh () {
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
}

function upgrade_sys () {
	echo '##### Updating System... #####'
	sudo pacman -Syu
	yay --aur -Syu

	#echo -e '\n##### Updating user packages... #####'
	#pip install --user -U $(pip list -o --user | awk 'NR > 2 {print $1}')
}

if [[ "$1" == "zsh" ]]; then
	upgrade_zsh
elif [[ ! "$1" ]]; then
	upgrade_sys
else
	exit 1
fi

echo
~/opt/cleanup.sh
echo -e '\n##### Done -- Press Enter to exit #####'
read
