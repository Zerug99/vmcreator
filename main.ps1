Get-Content .env | ForEach-Object {
    if ($_ -match "^(.*?)=(.*)$") {
        [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2].Trim())
    }
}

Import-Module "$PSScriptRoot\vmceator.psm1" -Force