# Downloads Repository

This repository contains essential binaries and scripts for setting up a specific environment. The binaries include tools such as Suricata, Sysmon, and Npcap, while the PowerShell script assists in downloading and installing these tools.
Contents

- Suricata-6.0.13-1-64bit.msi: Installer for the Suricata network IDS, IPS, and network security monitoring engine.
- Sysmon.exe: Sysinternals System Monitor (Sysmon) installation binary.
- npcap-1.77.exe: Npcap installation binary.
- powershellscript.ps1: PowerShell script for downloading and installing the aforementioned tools.
- sysmonconfig-export.xml: Configuration file for Sysmon.

Installation Instructions
Prerequisites

1. Ensure you have administrative rights on your machine.
2. PowerShell execution policy should be set to allow script execution (Set-ExecutionPolicy Unrestricted).

Steps
1. Clone the Repository:

    git clone https://github.com/gshfi/downloads.git
    cd downloads

2. Run the PowerShell Script:
Before executing the script, you might want to review its contents to ensure you're familiar with what it does.
    powershell -ExecutionPolicy Bypass -File powershellscript.ps1

3. Npcap Installation:
The free version of Npcap doesn't support silent installation. The script will initiate the installation process, but you'll need to follow on-screen prompts to complete the installation.

4. Post-Installation:

After the installations complete, the <b>suricata.yaml</b> configuration file will open in Notepad for manual adjustments. Please review and modify the configurations as per your requirements and save the file.

Note
It's essential to always be careful when running scripts, especially with administrative privileges. Only run scripts from trusted sources.

Contribution

If you'd like to contribute to this repository, please create a pull request or raise an issue for any bugs or feature requests.