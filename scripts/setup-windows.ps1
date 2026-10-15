$repo = "$HOME\dotfiles"

Write-Host "Setting up dotfiles..."

# .config
New-Item -ItemType Directory -Path "$HOME\.config" -Force | Out-Null

# PowerShell
if (!(Test-Path "$HOME\.config\powershell")) {
    New-Item `
        -ItemType SymbolicLink `
        -Path "$HOME\.config\powershell" `
        -Target "$repo\windows\powershell"
}

# Oh My Posh
if (!(Test-Path "$HOME\.config\oh-my-posh")) {
    New-Item `
        -ItemType SymbolicLink `
        -Path "$HOME\.config\oh-my-posh" `
        -Target "$repo\common\oh-my-posh"
}

# Git
if (!(Test-Path "$HOME\.config\git")) {
    New-Item `
        -ItemType SymbolicLink `
        -Path "$HOME\.config\git" `
        -Target "$repo\common\git"
}

# PowerShell native profile
New-Item -ItemType File -Path $PROFILE -Force | Out-Null

Set-Content `
    -Path $PROFILE `
    -Value '. "$HOME\.config\powershell\profile.ps1"'

Write-Host "Done."