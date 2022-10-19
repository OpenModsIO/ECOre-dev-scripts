#!/bin/bash

# import .env configs
export $(cat .env | xargs) 

# add to .gitignore if none initiated
[ -f ".gitignore" ] && touch .gitignore && echo "build" >> .gitignore

ECO_BUILD_DIR="./build/$ECO_BUILD_TARGET"
ECO_DOWNLOAD="EcoModKit_$ECO_BUILD_TARGET"
mkdir -p "$ECO_BUILD_DIR"
if [ -z ${ECO_BUILD_TARGET+x} ]; then
  echo "No build target env found. Set one, e.g.: export ECO_BUILD_TARGET=v0.9.6.3-beta";
  exit 1;
else
  echo "Found a build target ('$ECO_BUILD_TARGET'), proceeding to build...";
fi

cd $ECO_BUILD_DIR
curl "https://play.eco/s3/release/$ECO_DOWNLOAD.zip" -J -L -o $ECO_DOWNLOAD.zip
unzip -o $ECO_DOWNLOAD.zip

# Make a copy of only the DLLs for easier importing 
mkdir -p "dll"
cp ReferenceAssemblies/*.dll dll/
