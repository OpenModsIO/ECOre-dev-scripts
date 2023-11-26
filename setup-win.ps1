# PowerShell script for Windows

# Default values
$DEFAULT_RELEASE_VERSION = "v0.9.7.13-beta"
$DEFAULT_STAGING_VERSION = "v0.10.0.0-beta-staging-2816"
$VERSION_TYPE = "release"
$VERSION = $DEFAULT_RELEASE_VERSION
$NO_CONFIRM = $false
$STAGING = $false

# Check for arguments
foreach ($arg in $args) {
    switch ($arg) {
        "--no-confirm" { $NO_CONFIRM = $true }
        "--staging" {
            $STAGING = $true
            $VERSION_TYPE = "staging"
            $VERSION = $DEFAULT_STAGING_VERSION
        }
    }
}

# User input for version selection
if (-not $NO_CONFIRM) {
    Write-Host "Select the version to install:"
    Write-Host "1. Release ($DEFAULT_RELEASE_VERSION)"
    Write-Host "2. Staging ($DEFAULT_STAGING_VERSION)"
    $user_choice = Read-Host "Enter your choice (1 or 2, default: 1)"
    if ($user_choice -eq "2") {
        $VERSION_TYPE = "staging"
        $VERSION = $DEFAULT_STAGING_VERSION
    }
}

# Current directory check
$INSTALL_DIR = "./eco-$VERSION"
Write-Host "Installation Directory: $INSTALL_DIR"  # Debugging line
if (Test-Path $INSTALL_DIR) {
    Write-Host "Eco version already installed in $INSTALL_DIR. Aborting."
    exit
}

if (-not $NO_CONFIRM) {
    # Concatenate the prompt string before using it in Read-Host
    $installPrompt = "Install into " + $INSTALL_DIR + "? [Y/n]: "
    $confirm_install = Read-Host $installPrompt
    if ($confirm_install -eq "n" -or $confirm_install -eq "N") {
        Write-Host "Installation aborted."
        exit
    }
}

# Proceed with installation
New-Item -ItemType Directory -Force -Path $INSTALL_DIR
Set-Location $INSTALL_DIR

# Import .env configs if available
if (Test-Path "../.env") {
    Get-Content "../.env" | ForEach-Object { $key, $value = $_ -split '=', 2; Set-Variable -Name $key -Value $value }
}

# Check and update .gitignore
if (-not (Test-Path '../.gitignore')) {
    New-Item -ItemType File -Path '../.gitignore'
}
Add-Content '../.gitignore' "build"

$ECO_BUILD_DIR = "./build"
$ECO_DOWNLOAD = "EcoModKit_$VERSION"
New-Item -ItemType Directory -Force -Path $ECO_BUILD_DIR

Set-Location $ECO_BUILD_DIR
Invoke-WebRequest "https://play.eco/s3/$VERSION_TYPE/$ECO_DOWNLOAD.zip" -OutFile "$ECO_DOWNLOAD.zip"
Expand-Archive -Path "$ECO_DOWNLOAD.zip" -DestinationPath "."

# Check if ReferenceAssemblies directory exists
if (Test-Path "ReferenceAssemblies") {
    # Make a copy of only the DLLs for easier importing
    New-Item -ItemType Directory -Force -Path "dll"
    Copy-Item "ReferenceAssemblies\*.dll" -Destination "dll"

    # Cleanup
    Remove-Item -Recurse -Force "ReferenceAssemblies"
} else {
    Write-Host "ReferenceAssemblies directory not found."
}

Remove-Item "$ECO_DOWNLOAD.zip"

# Extract Unity version
$UNITY_VERSION = Get-Content "ProjectVersion.txt" | Where-Object { $_ -match 'm_EditorVersion:' } | ForEach-Object { ($_ -split ' ')[1] }

# Echo the success message
Write-Host "Successfully finished downloading, extracting and cleaning up."
Write-Host "Unpacked the Modkit for $VERSION for Unity version $UNITY_VERSION."
Write-Host "Add the files in the dll directory to your IDE, and/or load the EcoModKit.unitypackage file in Unity."
