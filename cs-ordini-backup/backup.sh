#!/bin/bash

# Directory o file da eseguire il backup
SOURCE_DIR="/path/to/source"
# Remoto Rclone da utilizzare (corrisponde al nome nel file rclone.conf)
REMOTE="remote"
# Directory di destinazione nel remoto
DEST_DIR="backup"

# Esegui il comando Rclone per eseguire il backup
rclone sync "$SOURCE_DIR" "$REMOTE:$DEST_DIR" --verbose

# Aggiungi ulteriori comandi o opzioni Rclone secondo necessità
# ad esempio per escludere determinati file o directory:
# rclone sync "$SOURCE_DIR" "$REMOTE:$DEST_DIR" --exclude "excluded_dir/**" --verbose
