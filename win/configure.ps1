Write-Output "Setting up Windows config files from: $PSScriptRoot"
Write-Output "  User Home: $HOME"

function Set-Link {
    param (
        $Target,
        $Link
    )

    if (Test-Path "$Link") {
        Remove-Item "$Link"
    }
    cmd /c mklink "$Link" "$Target"
}

Copy-Item "$PSScriptRoot\..\vscode\settings.json" "$HOME\AppData\Roaming\Code\User\settings.json"

# Bin links

if (!(Test-Path "C:\bin")) {
    New-Item -Path "C:\Bin" -ItemType "directory"
}
# Copy-Item "$PSScriptRoot\ahk\ahk-cppdev.ahk" "C:\Bin\ahk-cppdev.ahk"
# Copy-Item "$PSScriptRoot\ahk\ahk-modifiers.ahk" "C:\Bin\ahk-modifiers.ahk"
# Copy-Item "$PSScriptRoot\ahk\ahk-setup.ps1" "C:\Bin\ahk-setup.ps1"
Copy-Item "$PSScriptRoot\bin\vs.bat" "C:\Bin\vs.bat"
