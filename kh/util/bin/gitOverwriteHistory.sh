#!/bin/bash

set -eu

# Der Pfad zur Datei, die überschrieben werden soll.
FILE=$1

# Die aktuelle Version der Datei sichern.
cp $FILE /tmp/temp_file_backup

# Die gesamte Historie der Datei durch die aktuelle Version ersetzen.
git filter-branch --force --index-filter \
"git rm --cached --ignore-unmatch $FILE; \
cp /tmp/temp_file_backup $FILE; \
git add $FILE" --prune-empty --tag-name-filter cat -- --all

# Die temporäre Datei entfernen.
rm /tmp/temp_file_backup

