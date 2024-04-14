#!/bin/bash

set -eu

# Stellen Sie sicher, dass ein Repository-Name als Argument übergeben wurde
if [ "$#" -ne 1 ]; then
    echo "Verwendung: $0 <repository-name>"
    exit 1
fi

# Variablen
REPO_NAME=$1
USERNAME="dietmarz"  # Ihr GitHub-Benutzername

# Prüfen, ob 'gh' installiert ist
if ! command -v gh &> /dev/null
then
    echo "'gh' (GitHub CLI) konnte nicht gefunden werden. Bitte installieren Sie 'gh', um fortzufahren."
    exit
fi


# Versuch, den Remote zu entfernen
if git remote remove origin; then
    echo "Remote 'origin' erfolgreich entfernt."
else
    echo "Fehler: Remote 'origin' konnte nicht entfernt werden. Möglicherweise existiert der Remote nicht."
    # Optionale weitere Fehlerbehandlung
fi


# GitHub Repository erstellen und als Remote hinzufügen
gh repo create $USERNAME/$REPO_NAME --public --source=. --remote=origin

# Ermitteln des aktuellen Branch-Namens
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Pushen Sie zum neu erstellten GitHub Repository
git push -u origin $CURRENT_BRANCH

echo "Repository $REPO_NAME wurde erfolgreich auf GitHub erstellt und die lokale Kopie wurde aktualisiert."
