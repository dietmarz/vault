#!/bin/bash

# Überprüft, ob das erste Argument eine Zahl ist
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; then
   echo "Usage: $0 <max_size_in_kB>"
   echo "Beispiel: $0 200"
   exit 1
fi

# Maximale Dateigröße in Kilobytes, übergeben als erstes Skriptargument
max_size=$1

# Finde alle .jpg, .JPG, .jpeg, .JPEG Dateien im aktuellen Verzeichnis und Unterordnern
find . -iregex '.*\.\(jpg\|jpeg\)$' | while read img; do
    # Initialisiere die Qualitätsstufe für ImageMagick
    quality=95
    current_size=$(du -k "$img" | cut -f 1)

    while [ $current_size -gt $max_size ]; do
        # Reduziere die Qualität des Bildes
        convert "$img" -quality $quality "$img"

        # Aktualisiere die aktuelle Dateigröße
        current_size=$(du -k "$img" | cut -f 1)

        # Reduziere die Qualität für den nächsten Durchgang
        ((quality-=5))

        # Notfallabbruch, um Endlosschleifen zu vermeiden
        if [ $quality -le 10 ]; then
            echo "Kann die Dateigröße für $img nicht unter $max_size kB reduzieren."
            break
        fi
    done
done
