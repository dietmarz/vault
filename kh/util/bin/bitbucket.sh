#!/bin/bash

git remote add bitbucket "https://zabel@bitbucket.org/zabel/$1.git"
git push -f -u bitbucket --mirror
git remote remove bitbucket


