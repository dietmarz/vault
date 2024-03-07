#!/bin/bash

if [[ $1 == "--help" ]]; then
    echo "Usage:"
    echo "deleteBranch.sh <branchName>"
    exit 0
fi

BRANCH=$1

git branch -D "$BRANCH" ; git push origin --delete "$BRANCH"