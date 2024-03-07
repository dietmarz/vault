#!/bin/bash

BACKUPDIR=/drive_t5/sicherung/files
DATE=$(date +"%Y-%m-%d")

TARGETDIR=$BACKUPDIR/$DATE

mkdir -p $TARGETDIR

cp ~/.bash_aliases $TARGETDIR
cp ~/.bashrc $TARGETDIR
cp ~/.gitconfig $TARGETDIR
cp ~/.m2/settings.xml $TARGETDIR
