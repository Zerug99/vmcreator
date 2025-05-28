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

        $vmxPath = "$vmPath\$Name.vmx"
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

        $vmxContent | Set-Content -Path $vmxPath -Encoding UTF8

        Push-Location $vmPath
        & $env:VMWARE_VDISKMANAGER -c -s ${Disk}GB -a lsilogic -t 0 "$Name.vmdk"
        Pop-Location
    }
    catch {
        
    }
}