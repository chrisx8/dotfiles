#!/bin/bash

git_web_url="$(git remote get-url origin | sed -r "s/ssh:\/\/.+@/https:\/\//g" | sed -r "s/:[0-9]+//g")"

echo "Opening $git_web_url"
if [ "$(uname -s)" == "Darwin" ]; then
	open "$git_web_url"
else
	xdg-open "$git_web_url"
fi
