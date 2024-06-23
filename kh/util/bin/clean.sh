#!/bin/bash

# Liste der Ordner, die durchsucht und gelöscht werden sollen
dirs=("node_modules" "dist" "build" ".cache" ".tmp" "tmp" "out" "target" ".next" ".nuxt" "vendor" "Pods" "bower_components" ".gradle" ".sass-cache" ".pytest_cache" ".mypy_cache" ".tox" ".nyc_output" "coverage" ".parcel-cache" ".expo" ".serverless")

# Funktion zur Anzeige der Ordnergrößen
display_sizes() {
  echo "Directory Size Report:"
  # Erstelle das Suchmuster für find
  find_pattern=$(printf -- "-name %s -o " "${dirs[@]}")
  find_pattern=${find_pattern% -o } # Entferne das letzte '-o'

  # Suche nach den Verzeichnissen und berechne die Größe
  find . -type d \( $find_pattern \) -exec du -sh {} + 2>/dev/null
}

# Funktion zum Löschen der Verzeichnisse
delete_directories() {
  echo "Deleting Directories..."
  # Erstelle das Suchmuster für find
  find_pattern=$(printf -- "-name %s -o " "${dirs[@]}")
  find_pattern=${find_pattern% -o } # Entferne das letzte '-o'

  # Suche nach den Verzeichnissen und lösche sie
  find . -type d \( $find_pattern \) -exec rm -rf {} + 2>/dev/null
  echo "Deletion completed."
}

# Überprüfen, ob das Skript mit der Option -d ausgeführt wird
if [[ "$1" == "-d" ]]; then
  delete_directories
else
  display_sizes
fi
