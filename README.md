# Hi, I'm Robson!

I am a self-taught cybersecurity learner interested in cyber defense topics such as, but not limited to, network security, endpoint protection, log analysis, incident response, threat intelligence, threat hunting, vulnerability management, malware, and web applications Security.

---

# Badges & Skills
[<img src="https://tryhackme-badges.s3.amazonaws.com/robsann.png" alt="TryHackMe">](https://tryhackme.com/p/robsann)

---

# [Learning Paths & Courses Credentials](https://github.com/robsann/robsann/blob/main/courses.md)

---

# Cybersecurity Projects & Labs
## [Threat Hunting with Elastic Stack 8 (XDR)](https://github.com/robsann/ElasticStackLab)
- Configured in VirtualBox:
    - DHCP Server
    - Ubuntu Server (Elastic Host)
    - Windows 10 (Victim)
- Configured Elastic Stack 8 on Ubuntu Server:
    - Elastic Stack: Elasticsearch, Kibana (UI), and Integrations.
    - Integrations Fleet Server, Elastic Agent, System, Windows, and Elastic Defend.
    - Added Fleet Server (Ubuntu Server) and Agent (Windows 10) using Elastic Agent.
- Simulated tests:
    - EICAR Malware Test.
    - MITRE ATT&CK Test with Red Team Automation (RTA).

## [Microsoft Sentinel (SIEM) Attack Map](https://github.com/robsann/AzureSentinelSIEMAttackMap)
- Configured an exposed Windows 10 VM in Microsoft Azure to monitor failed RDP login attempts from global attackers using Microsoft Sentinel (SIEM).
- Used a custom PowerShell script that extracts failed login events from Event Viewer Security Log, forwards them to a third-party API to get geolocation data, and generates a log file with geolocation and event data. 
- Created a custom table in Log Analytics Workspace on Azure using the previously generated log file and queried the table to extract custom fields using Kusto Query Language (KQL).
- Created a workbook in Microsoft Sentinel (SIEM) using KQL to display global attack data (RDP login failure) on the world map according to physical location and magnitude (attack count).

## [LimaCharlie (EDR) Telemetry](https://github.com/robsann/LimaCharlieEDRTelemetry)
- Configured in VirtualBox:
    - Windows 11 (Target) with Virus & Threat Protection disabled, Sysmon and LimaCharlie (EDR) Sensor installed
    - Ubuntu Server (Attack) with Sliver installed, a Command & Control (C2) framework by BishopFox.
- Generated C2 payload on Attack Machine, executed the payload on Target Machine, and started C2 session on Attack Machine.
- Used C2 session to perform two attacks on Target Machine:
    - LSASS access (credentials stealing)
    - Shadow Copies deletion using vssadmin.exe (used in Ransomware attacks).
- Created Detection & Response Rules in LimaCharlie (EDR) to detect the two previous attacks using the telemetry generated and tested the rules by performing the attacks again.

## Pentesting & Network Security with Snort (IDS/IPS)
- Network IDS/IPS setup using Snort in Ubuntu.
- NMAP scan detection using Snort (NIDS):
    - Identify NMAP Ping Scan, TCP Scan, XMAS Scan, FIN Scan, NULL Scan, and UDP Scan.
- Attack detection using Snort (NIDS):
    - SQL injection attacks using WPSCan & Wordpress and Burp Suite & SQLmap.
    - Backdoor attacks using Empire and Katana.
    - Rogue DHCP & Rogue Routing attacks.
    - ICMP Redirect attack.


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
