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


try {
    New-VMConfig -Name $vmName -CPU $cpuCount -RAM $ramSize -Disk $diskSize -ISO $isoPath
    Start-VM -Name $vmName
    Write-Log -Message "VM '$vmName' skapades och startades."
} catch {
    Write-Log -Message "Fel vid skapande av VM: $_"
    Write-Error $_
}


