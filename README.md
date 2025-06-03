# vmcreator – projekt

## Innehåll

- Vad scriptet gör
- körinstruktioner
- Reflektion

## Scriptens funktion

Detta PowerShell-skript automatiserar skapandaet av Virtuell maskin i VMware Workstation Pro som är ett programm som man kan manuellt skapa vms i. 
Scriptet frågar användare om parametrar som behövs till .vmx-filen och vmware-vdiskmanager.exe

## Krav för att använda skriptet 
- Vmware Workstation Pro 
- Iso fil t.ex. windows 10 
- .env fil med sökvägar:
- VM_FOLDER=Sökvägen där virtuella maskiner (VM) kommer att sparas.
- VMWARE_VDISKMANAGER=Pekar på verktyget vmware-vdiskmanager.exe som används för att skapa och hantera virtuella hårddiskar.
- VMRUN_PATH=ska peka på vmrun.exe, ett kommandoverktyg för att t.ex. starta, stoppa och hantera VM:er via script.
- VMWARE_GUI_PATH=Pekar på vmware.exe, själva användargränssnittet för VMware Workstation Pro.



- Kör main.ps1 och fyll i det som frågas efter.


## Reflektion 
Gruppen ville skapa något som man kan ha nytta av och som man har lärt sig genom utbildningens gång och bygga på det.
Gruppen tyckte att det var häftigt att kunna styra ett program genom PowerShell och skippa göra det manuellt. 
Skapa ett ordenligt struktur för kodingen var nycklen till att hålla koden organiserat och göra felsökningen enkel tycker gruppen.
Det svåra var att hitta vilka parametrar som är viktiga att ta med och alla paths. Man fick inte glömma att inte gita upp känslig information och vi använde gitignore.
Vi skapade flera bracnhes och löste alla merges.
