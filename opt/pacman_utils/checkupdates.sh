#!/bin/bash

timeout 5 yay --aur -Su &> /dev/null
checkupdates
yay --aur -Qu 2> /dev/null | grep -v '\[.*\]'
exit 0
