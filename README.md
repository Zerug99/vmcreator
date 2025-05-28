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
- .env fil med sökvägar 
sökvägen där vms ska sparas 
sökvägen till vmware-vdiskmanager.exe
sökvägen till vmrun.exe
Sökvägen till vmware.exe
Dessa hittas i VMware Workstation

- Kör main.ps1 och fyll i det som frågas efter.


## Reflektion 
Gruppen ville skapa något som man kan ha nytta av och något som man har lärt sig genom utbildningens gång och bygga på det.
Gruppen tyckte att det var häftigt att kunna styra ett program genom PowerShell och skippa göra det manuellt. 
Skapa ett ordenligt struktur för kodingen var nycklen till att hålla koden organiserat och göra felsökningen enkel tycker gruppen.
Det svåra var att hitta vilka parametrar som är viktiga att ta med pch alla paths. Man fick inte glömma att inte gita upp känslig information och vi använde gitignore.
Vi skapade flera bracnhes och löste alla merges.
