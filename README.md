# ECOre Dev Scripts

## Overview

The ECOre Dev Scripts repository offers tools for setting up development environments for Eco, a game by Strange Loop Games. These scripts simplify downloading server files, establishing development setups, and packaging mods.

## Usage

### For Linux/MacOS
Use `setup.sh` script:
`./setup-linux.sh`

### For Windows
Use `setup.ps1` script in PowerShell:
`.\setup-win.ps1`

### Features
- Automated downloading of Eco server files and reference DLLs.
- Option to choose between release and staging versions of Eco.
- Command-line arguments:
  - `--no-confirm`: Skip confirmation prompts, using default choices.
  - `--staging`: Directly choose the staging version of Eco.

### Planned
- Server and Client download
- Existing directory update, repair, remove
- ECOre mod download/population

### Notes for Windows
- Tested on Windows 11
- Ensure PowerShell execution policy allows script execution (`Get-ExecutionPolicy` and `Set-ExecutionPolicy`).

## Getting Started

1. Clone the repository.
2. Choose and run the appropriate script based on your OS.
3. Follow the prompts to complete the setup for the desired Eco version.

## Contributing

We welcome contributions! Feel free to suggest improvements or report issues via issues or pull requests.
