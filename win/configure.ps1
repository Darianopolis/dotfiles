Write-Output "Setting up Windows config files from: $PSScriptRoot"
Write-Output "  User Home: $HOME"

function Set-Link {
    param (
        $Link,
        $Target
    )

    if (Test-Path "$Link") {
        Remove-Item "$Link"
    }
    cmd /c mklink "$Link" "$Target"
}

Set-Link "$HOME\AppData\Roaming\Code\User\settings.json" "$PSScriptRoot\..\vscode\settings.json"

# Bin links

if (!(Test-Path "C:\bin")) {
    New-Item -Path "C:\bin" -ItemType "directory"
}
Set-Link "C:\bin\ahk-cppdev.ahk" "$PSScriptRoot\ahk\ahk-cppdev.ahk"
Set-Link "C:\bin\ahk-modifiers.ahk" "$PSScriptRoot\ahk\ahk-modifiers.ahk"
Set-Link "C:\bin\ahk-setup.ps1" "$PSScriptRoot\ahk\ahk-setup.ps1"
Set-Link "C:\bin\vs.bat" "$PSScriptRoot\bin\vs.bat"