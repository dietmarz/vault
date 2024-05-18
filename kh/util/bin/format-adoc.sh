#!/bin/bash

# Überprüfe, ob ENV_VAULT gesetzt ist
if [[ -z "${ENV_VAULT}" ]]; then
    echo "ENV_VAULT ist nicht gesetzt. Bitte setze das ENV_VAULT Umgebungsvariable."
    exit 1
fi

# Gehe rekursiv durch alle .adoc-Dateien im ENV_VAULT Verzeichnis
find "${ENV_VAULT}" -type f -name "*.adoc" | while read -r file; do
  if [[ -f $file ]]; then
        # Ersetze '** ' am Zeilenanfang durch ' **'
        sed -i -E 's/^\*\* /  ** /' "$file"
        # echo "Bearbeitet: $file"
    fi
done

echo "Alle adoc dateien wurden formatiert"
