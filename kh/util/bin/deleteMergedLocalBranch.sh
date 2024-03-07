#!/bin/bash

# Get the current branch so we don't accidentally delete it
current_branch=$(git symbolic-ref --short HEAD)

# Exclude list: adjust the branches in the grep -v pattern to fit your needs
exclude_pattern="^\*|^\s*$current_branch$|^\s*develop$|^\s*master$|^\s*main$"

# List all merged branches except the ones in the exclude pattern and then delete them
git branch --merged | grep -Ev "$exclude_pattern" | xargs -I {} git branch -d {}

echo "Deleted all merged branches except the excluded ones."
