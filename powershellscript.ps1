# Definieer de downloadlocaties en -namen
$url = "https://github.com/gshfi/downloads/archive/main.zip"
$zipFile = "$env:USERPROFILE\downloads\Installatie.zip"
$extractFolder = "$env:USERPROFILE\downloads\Installatie"

# Download het ZIP-bestand
Invoke-WebRequest -Uri $url -OutFile $zipFile
Write-Host "ZIP-bestand succesvol gedownload." -ForegroundColor Green

# Pak het ZIP-bestand uit
Expand-Archive -Path $zipFile -DestinationPath $extractFolder
Write-Host "ZIP-bestand succesvol uitgepakt naar $extractFolder." -ForegroundColor Green

# Verondersteld dat de benodigde bestanden zich nu in de uitgepakte folder bevinden
Set-Location -Path $extractFolder\downloads-main

# Installeer Sysmon
Start-Process "sysmon.exe" -ArgumentList "-accepteula -i sysmonconfig-export.xml" -NoNewWindow -Wait
Write-Host "Sysmon is succesvol geïnstalleerd." -ForegroundColor Green

# Installeer npcap
Start-Process "npcap-1.77.exe" -ArgumentList "/S" -NoNewWindow -Wait
Write-Host "npcap is succesvol geïnstalleerd." -ForegroundColor Green

# Installeer Suricata
Start-Process "msiexec.exe" -ArgumentList "/i Suricata-6.0.13-1-64bit.msi /qn" -NoNewWindow -Wait
Write-Host "Suricata is succesvol geïnstalleerd." -ForegroundColor Green

# Open de suricata.yaml file in Notepad voor handmatige bewerking
Start-Process "notepad.exe" -ArgumentList "C:\Program Files\Suricata\suricata.yaml"
Write-Host "Suricata configuratiebestand is geopend voor bewerking. Pas het bestand aan zoals nodig en sla het op." -ForegroundColor Yellow
