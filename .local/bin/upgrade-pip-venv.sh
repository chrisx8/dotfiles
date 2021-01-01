#!/bin/bash

if [[ -f requirements.txt ]] && [[ -d "$VIRTUAL_ENV" ]]; then
	echo "Upgrading all outdated packages..."
	pip install -U $(pip list --outdated --format=freeze | cut -d = -f 1)
	pip freeze > requirements.txt
else
	echo "No requirements.txt or activated virtual environment. Exiting..."
	exit 1
fi
