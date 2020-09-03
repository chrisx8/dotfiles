#!/bin/bash

if [[ -f requirements.txt ]] && [[ -d "$VIRTUAL_ENV" ]]; then
	sed -i 's/==/>=/g' requirements.txt
	pip install -U -r requirements.txt
	pip freeze > requirements.txt
else
	echo "No requirements.txt or activated virtual environment. Exiting..."
	exit 1
fi
