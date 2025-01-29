# MacOS Only Save Script 
#!/bin/bash

# WORKING_DIR=$(echo "$PWD") # Obtain the working directory

# Obtain working directory through argument

if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

WORKING_DIR="$1"

echo "Working directory: $WORKING_DIR"

SOURCE_DIR="$WORKING_DIR/mya_server_custom_models_resource_pack"
MINECRAFT_PATH="$HOME/Library/Application Support/minecraft/resourcepacks"
ARCHIVE_NAME="../Mya_Server_Custom_Models_Resource_Pack_1.21.4.zip"

if [ -d "$MINECRAFT_PATH" ]; then
    echo "Minecraft is installed at: $MINECRAFT_PATH"
    cd "$SOURCE_DIR"
    rm "$ARCHIVE_NAME"
    echo "Removed $ARCHIVE_NAME"
    zip -r "$ARCHIVE_NAME" ./* -x "*.DS_Store"
    cp "$ARCHIVE_NAME" "$MINECRAFT_PATH"
    echo "Successfully zipped and copied the resource pack."
else
    echo "Minecraft is not installed in the default location. Failed to obtain the path."
fi

