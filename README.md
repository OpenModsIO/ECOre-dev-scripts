# ECOre Dev Scripts
## Overview

This repository provides some scripts to set up local development environments, deploy servers, package mods and more.

## Current scripts:

### setup.sh

Run this with a version of Eco as the argument to download a copy of the server and reference DLLs. For example:

**Linux/MacOS:**
```bash
./setup.sh 9.7.6
```

**Windows:**

**!!This is borked and still not working, would appreciate any update/help to the below:**
1. Upon running the below command in PowerShell, you'll be prompted to visit a Microsoft Store page to download a Linux OS for WSL. Follow the link and download Alpine Linux, and when done, click Open in the Windows Store to finish install.
```bash
bash setup.sh 9.7.6
```
2. You will be dropped into a "Linux" shell after entering a UNIX Username and password. Navigate to this directory using these commands:
```bash
# this shows what directory you're currently in
pwd
# this 'changes directory'
cd (some directory)
# this shows what is inside the directory you're in
ls
```
Note that because WSL creates a separate 'install', you need to get to your C:/ drive (or similar) a different way. To get to your Windows C:/ drive:
```bash
cd /mnt/c
```
You can append additional directories to that, eg `/mnt/c/Users/YourAcc/Documents` which is the equivalent of C:/Users/YourAcc/Documents, aka your Documents folder.
3. Once you are in the correct directory (ECOre-dev-scripts), run these commands to install 'bash' and re-run the setup, like so:
```bash
# log in as a super user, it'll ask for a password
su
# install bash
apk add bash
# run the setup
bash setup.sh 9.7.6
```
