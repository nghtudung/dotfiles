# =========================
# Environment
# =========================

. "$HOME\.config\powershell\env.ps1"


# =========================
# Oh My Posh
# =========================

oh-my-posh init pwsh `
    --config "$HOME\.config\oh-my-posh\theme.omp.json" |
    Invoke-Expression


# =========================
# Zoxide
# =========================

Invoke-Expression (& {
    (zoxide init powershell | Out-String)
})


# =========================
# PSReadLine
# =========================

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView


# =========================
# Custom config
# =========================

. "$HOME\.config\powershell\aliases.ps1"
. "$HOME\.config\powershell\functions.ps1"


# =========================
# Local machine config
# =========================

$localConfig = "$HOME\.config\powershell\local.ps1"

if (Test-Path $localConfig) {
    . $localConfig
}