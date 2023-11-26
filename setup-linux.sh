#!/bin/bash

# Default values
DEFAULT_RELEASE_VERSION="v0.9.7.13-beta"
DEFAULT_STAGING_VERSION="v0.10.0.0-beta-staging-2816"
VERSION_TYPE="release"
VERSION=$DEFAULT_RELEASE_VERSION

# Check for arguments
for arg in "$@"
do
    case $arg in
        --no-confirm)
            NO_CONFIRM=true
            shift
            ;;
        --staging)
            VERSION_TYPE="staging"
            VERSION=$DEFAULT_STAGING_VERSION
            shift
            ;;
    esac
done

# User input for version selection
if [ -z "$NO_CONFIRM" ]; then
    echo "Select the version to install:"
    echo "1. Release ($DEFAULT_RELEASE_VERSION)"
    echo "2. Staging ($DEFAULT_STAGING_VERSION)"
    read -p "Enter your choice (1 or 2, default: 1): " user_choice

    if [ "$user_choice" == "2" ]; then
        VERSION_TYPE="staging"
        VERSION=$DEFAULT_STAGING_VERSION
    fi
fi

# Current directory check
INSTALL_DIR="./eco-$VERSION"
if [ -d "$INSTALL_DIR" ]; then
    echo "Eco version already installed in $INSTALL_DIR. Aborting."
    exit 1
fi

if [ -z "$NO_CONFIRM" ]; then
    read -p "Install into $INSTALL_DIR? [Y/n]: " confirm_install
    if [[ "$confirm_install" =~ ^[Nn] ]]; then
        echo "Installation aborted."
        exit 1
    fi
fi

# Proceed with installation
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Import .env configs if available
if [ -f "../.env" ]; then
    export $(cat ../.env | xargs)
fi

# Check and update .gitignore
if [ ! -f '../.gitignore' ]; then
    touch ../.gitignore
fi
echo "build" >> ../.gitignore

ECO_BUILD_DIR="./build"
ECO_DOWNLOAD="EcoModKit_$VERSION"
mkdir -p "$ECO_BUILD_DIR"

cd $ECO_BUILD_DIR
curl "https://play.eco/s3/$VERSION_TYPE/$ECO_DOWNLOAD.zip" -J -L -o $ECO_DOWNLOAD.zip
unzip -o $ECO_DOWNLOAD.zip

# Check if ReferenceAssemblies directory exists
if [ -d "ReferenceAssemblies" ]; then
    # Make a copy of only the DLLs for easier importing
    mkdir -p "dll"
    cp ReferenceAssemblies/*.dll dll/

    # Cleanup
    rm -rf ReferenceAssemblies
else
    echo "ReferenceAssemblies directory not found."
fi

rm -f $ECO_DOWNLOAD.zip

# Extract Unity version
#UNITY_VERSION=$(grep 'm_EditorVersion:' ProjectVersion.txt | cut -d ' ' -f 2)
UNITY_VERSION=$(grep 'm_EditorVersion:' ProjectVersion.txt | cut -d ' ' -f 2 | tr -d '\r' | tr -cd '\11\12\15\40-\176')

# Pause for 1 second
sleep 1

# Echo the success message
echo "Successfully finished downloading, extracting and cleaning up."
echo "Unpacked the Modkit for $VERSION for Unity version $UNITY_VERSION."
echo "Add the files in the dll directory to your IDE, and/or load the EcoModKit.unitypackage file in Unity."
