# Hi, I'm Robson!

I'm a self-taught Cybersecurity learner with interest in cyber defence topics such as Network Security, Endpoint Protection, Vulnerability Management, Incident Response, Threat Intelligence, Threat Hunting, Malware Analysis, and Web Application Security.

---

# Badges & Skills
[<img src="https://tryhackme-badges.s3.amazonaws.com/robsann.png" alt="TryHackMe">](https://tryhackme.com/p/robsann)

---

# [Learning Paths & Courses Credentials](https://github.com/robsann/robsann/blob/main/courses.md)

---

# Cybersecurity Projects
## [Azure Sentinel (SIEM) Attack Map](https://github.com/robsann/AzureSentinelSIEMAttackMap)
- Configured an exposed Windows 10 VM in Azure to monitor failed RDP login attempts from Global Attackers using Azure Sentinel (SIEM).
- Configured a Windows 10 VM with Firewall disabled and RDP (3389) port open and used a custom PowerShell script to extract metadata from Windows Event Viewer and forward it to a 3rd party API to get geolocation data.
- Configured a custom log in Log Analytics workspaces on Azure to ingest custom logs containing geographic information (latitude, longitude, state, and country) and extracted the fields using Kusto Query Language (KQL) to map geo data into Azure Sentinel.
- Configured an Azure Sentinel (SIEM) workbook to display global attack data (failed RDP login attempts) on the world map according to physical location and magnitude (count) of attacks.

## [LimaCharlie (EDR) Telemetry](https://github.com/robsann/LimaCharlieEDRTelemetry)
- Windows 11 (Target) with Virus & Threat Prodection disabled, Sysmon and LimaCharlie (EDR) Sensor installed.
- Ubuntu Server (Attack) with Sliver, a Command & Control (C2) framework by BishopFox.
- Generate C2 payload, execute payload from Target machine, and start C2 session.
- Create Detection & Response Rules in LimaCharlie (EDR) to detect:
    - LSASS access
    - Shadow copies deletion using vssadmin.exe

## Threat Hunting with ElasticStack
- Virtual DHCP Server on VirtualBox.
    - Ubuntu VM (ElasticHost)
    - Windows VM (Victim)
- Elastic Stack Installation on Ubuntu:
    - Elastic Search, Kibana, and Elastic-agent Installation.
    - Enabling the detection engine and Fleet.
    - Filebeat Installation and Enabling ThreatIntel module.
- First Scenario: Collecting Data From Windows 10 using beats:
    - WinLogBeat, PacktBeat and NPcap Installation.
- Second Scenario: Collecting Data From Windows 10 using Sysmon and Elastic-Agents:
    - Configuring Sysmon and Elastic Agents.
- Third Scenario: EICAR Malware Test.
- Fourth Scenario: MITRE ATT&CK.

## Lab Pentesting & Network Security (IDS/IPS)
- Network IDS/IPS setup using Snort in Ubuntu.
- NMAP scan detection using Snort.
    - Identify NMAP Ping Scan, TCP Scan, XMAS Scan, FIN Scan, NULL Scan, and UDP Scan.
- Attack detection by SQLi using WPSCan & Wordpress and using Burp Suite & SQLmap.
- Attack detection by Backdoor using Empire and using Katana.
- Attack detection by Rogue DHCP & Rogue Routing.
- Attack detection by ICMP Redirect.


<!--
**robsann/robsann** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->
