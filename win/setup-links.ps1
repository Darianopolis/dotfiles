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

Set-Link "C:\Bin\ahk-cppdev.ahk" "$PSScriptRoot\ahk\ahk-cppdev.ahk"
Set-Link "C:\Bin\ahk-modifiers.ahk" "$PSScriptRoot\ahk\ahk-modifiers.ahk"
Set-Link "C:\Bin\ahk-setup.ps1" "$PSScriptRoot\ahk\ahk-setup.ps1"
