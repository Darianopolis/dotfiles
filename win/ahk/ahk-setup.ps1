Write-Output "Starting AHK Scripts in: $PSScriptRoot"

Start-Process "$PSScriptRoot\ahk-cppdev.ahk"
Start-Process "$PSScriptRoot\ahk-modifiers.ahk"
