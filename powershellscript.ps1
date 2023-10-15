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

# Download de regels naar C:\Program Files\Suricata\rules\
$baseURL = "https://rules.emergingthreats.net/open/suricata/rules/"
$rulesDestination = "C:\Program Files\Suricata\rules\"
$rulesList = @(
    "botcc.rules",
    "botcc.portgrouped.rules",
    "ciarmy.rules",
    "compromised.rules",
    "drop.rules",
    "dshield.rules",
    "emerging-activex.rules",
    "emerging-adware_pup.rules",
    "emerging-attack_response.rules",
    "emerging-chat.rules",
    "emerging-coinminer.rules",
    "emerging-current_events.rules",
    "emerging-dns.rules",
    "emerging-dos.rules",
    "emerging-exploit.rules",
    "emerging-ftp.rules",
    "emerging-games.rules",
    "emerging-icmp_info.rules",
    "emerging-icmp.rules",
    "emerging-imap.rules",
    "emerging-inappropriate.rules",
    "emerging-info.rules",
    "emerging-ja3.rules",
    "emerging-malware.rules",
    "emerging-misc.rules",
    "emerging-mobile_malware.rules",
    "emerging-netbios.rules",
    "emerging-phishing.rules",
    "emerging-p2p.rules",
    "emerging-policy.rules",
    "emerging-pop3.rules",
    "emerging-rpc.rules",
    "emerging-scada.rules",
    "emerging-scan.rules",
    "emerging-shellcode.rules",
    "emerging-smtp.rules",
    "emerging-snmp.rules",
    "emerging-sql.rules",
    "emerging-telnet.rules",
    "emerging-tftp.rules",
    "emerging-user_agents.rules",
    "emerging-voip.rules",
    "emerging-web_client.rules",
    "emerging-web_server.rules",
    "emerging-web_specific_apps.rules",
    "emerging-worm.rules",
    "tor.rules"
)
foreach ($rule in $rulesList) {
    $ruleURL = "${baseURL}${rule}"
    $outFile = Join-Path -Path $rulesDestination -ChildPath $rule
    Invoke-WebRequest -Uri $ruleURL -OutFile $outFile
    Write-Host "Downloaded $rule to $outFile" -ForegroundColor Green
}

# Open de suricata.yaml file in Notepad voor handmatige bewerking
Start-Process "notepad.exe" -ArgumentList "C:\Program Files\Suricata\suricata.yaml"
Write-Host "Suricata configuratiebestand is geopend voor bewerking. Pas het bestand aan zoals nodig en sla het op." -ForegroundColor Yellow
