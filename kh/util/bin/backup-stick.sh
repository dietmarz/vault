#!/bin/bash
set -eu

STICK="/media/dietmar/BACKUP"
if [ ! -d "$STICK" ]; then
  echo "Error: Destination path '$STICK' does not exist or is not a directory."
  exit 1
fi

DATE=$(date "+%Y_%m_%d-%H_%M_%S")


# Definiere eine Funktion mit dem Namen 'rsync_backup'
rsync_backup() {
  if [ $# -ne 1 ]; then
    echo "Usage: rsync_backup source_path"
    return 1
  fi

 # Überprüfe, ob der Quellpfad existiert
  if [ ! -e "$1" ]; then
    echo "Warning: Source path '$1' does not exist."
    return 0
  fi

  # Without ending / char
  SOURCE="${1%/}"

  echo "................................................................."
  echo "copying $SOURCE"
  rsync -a --info=progress2 --delete                                     --no-inc-recursive --human-readable --exclude '.git/' --no-links "$SOURCE" "$STICK"
# rsync -a --info=progress2 --delete  --backup --backup-dir=_trash/$DATE --no-inc-recursive --human-readable --exclude '.git/' --no-links "$SOURCE" "$STICK"
}

# Verwende die Funktion mit Quelle und Ziel als Argumente
rsync_backup /home/dietmar/Desktop
rsync_backup /home/dietmar/.ssh
rsync_backup /home/dietmar/.bashrc
rsync_backup /home/dietmar/.gitconfig
rsync_backup "$ENV_OFFICE"
rsync_backup "$ENV_VAULT"
rsync_backup /home/dietmar/cloud/photo
rsync_backup "/home/dietmar/cloud/andi/Christian Meyer/all-mp3gain"


# Berechne den freien Speicherplatz, den benutzten Speicherplatz und die Gesamtkapazität
free_space=$(df -h "$STICK" | awk 'NR==2 {print $4}')
used_space=$(df -h "$STICK" | awk 'NR==2 {print $3}')
total_space=$(df -h "$STICK" | awk 'NR==2 {print $2}')

echo "================================================================="
echo "Backup done. $free_space left on device. ($used_space used of $total_space total)"
echo "================================================================="
