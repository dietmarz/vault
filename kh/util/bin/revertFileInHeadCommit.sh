#!/bin/bash

git show HEAD -- $@ | git apply -R
