function New-VMConfig {
    param (
        [string]$Name,  # Namn på den virtuella maskinen
        [int]$CPU,      # Antal CPU-kärnor
        [int]$RAM,      # RAM i MB
        [int]$Disk,     # Diskstorlek i GB
        [string]$ISO    # Sökväg till ISO-fil för OS-installation
    )
    try {
        # Skapa en mapp för VM:n
        $vmPath = "$env:VM_FOLDER\$Name"
        New-Item -ItemType Directory -Path $vmPath -Force | Out-Null

        # Definiera sökvägen till .vmx-konfigurationsfilen
        $vmxPath = "$vmPath\$Name.vmx"

        # Array med parametrar till .vmx-filen
        $vmxContent = @(
            'encoding = "UTF-8"',
            'config.version = "8"',
            'virtualHW.version = "16"',
            "guestOS = ""windows10-64""",
            "memsize = $RAM",
            "numvcpus = $CPU",
            "nvme0.present = ""TRUE""",
            "nvme0:0.fileName = `"$Name.vmdk`"",
            "nvme0:0.present = ""TRUE""",
            'ide1:0.present = "TRUE"',
            "ide1:0.fileName = `"$ISO`"",
            "ide1:0.deviceType = ""cdrom-image""",
            "ethernet0.present = ""TRUE""",
            "ethernet0.connectionType = ""nat""",
            "displayName = `"$Name`"",
            "virtualHW.productCompatibility = ""hosted""",
            "nvram = `"$Name.nvram`"",
            "pciBridge0.present = ""TRUE""",
            "pciBridge4.present = ""TRUE""",
            "pciBridge4.virtualDev = ""pcieRootPort""",
            "pciBridge4.functions = ""8""",
            "tools.syncTime = ""TRUE"""
        )

        # Skriv innehållet till .vmx-filen
        $vmxContent | Set-Content -Path $vmxPath -Encoding UTF8

        # Skapa VMDK-disk med VMware's diskverktyg
        Push-Location $vmPath
        & $env:VMWARE_VDISKMANAGER -c -s ${Disk}GB -a lsilogic -t 0 "$Name.vmdk"
        Pop-Location
    }
    catch {
        # Felhantering
        throw "Misslyckades med att skapa VM-konfiguration: $_"
    }
}

function Start-VM {
    param ([string]$Name)                           # Namn på den VM som ska startas
    $vmxPath = "$env:VM_FOLDER\$Name\$Name.vmx"     # Sökväg till VM-konfigurationen
    & $env:VMRUN_PATH start $vmxPath nogui          # Starta VM i bakgrunden utan GUI


    # Öppna även i Workstation GUI för att synas i listan
    Start-Sleep -Seconds 1
    & $env:VMWARE_GUI_PATH $vmxPath
    Write-Log -Message "VM '$Name' öppnades i VMware GUI."     # Logga att VM startades
}


function Write-Log {
    param ([string]$Message)
    $logPath = "$PSScriptRoot\vm_log.txt"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp`t$Message"
    $logEntry | Add-Content -Path $logPath
    Write-Output $logEntry
}

# Den sista funktionen är för att skriva ett logg på där vm skapades och ange vms namn bland annat 
