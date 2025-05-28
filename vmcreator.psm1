function New-VMConfig {
    param (
        [string]$Name,
        [int]$CPU,
        [int]$RAM,
        [int]$Disk,
        [string]$ISO
    )
    try {
        $vmPath = "$env:VM_FOLDER\$Name"
        New-Item -ItemType Directory -Path $vmPath -Force Out-Null
        
    }
    catch {
        
    }
}