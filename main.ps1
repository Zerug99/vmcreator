Get-Content .env | ForEach-Object {
    if ($_ -match "^(.*?)=(.*)$") {
        [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2].Trim())
    }
}

Import-Module "$PSScriptRoot\vmcreator.psm1" -Force

$vmName = Read-Host "Ange namn på VM"
$cpuCount = Read-Host "Ange antal CPU-kärnor"
$ramSize = Read-Host "Ange RAM i MB"
$diskSize = Read-Host "Ange hårddiskstorlek i GB"
$isoPath = Read-Host "Ange sökväg till ISO-fil"



