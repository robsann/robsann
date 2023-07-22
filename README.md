# Hi, I'm Robson!

I am a self-taught cybersecurity learner interested in cyber defense topics such as, but not limited to, network security, endpoint protection, log analysis, incident response, threat intelligence, threat hunting, vulnerability management, malware analysis, and web applications Security.

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
    - Elastic Stack: Elasticsearch, Kibana (UI), and Elastic Agent + Integrations.
    - Integrations Fleet Server, System, Windows, and Elastic Defend.
- Simulated two malicious tests:
    - EICAR Malware Test.
    - MITRE ATT&CK Test with Red Team Automation (RTA).

## [Attack Monitoring with Microsoft Sentinel (SIEM)](https://github.com/robsann/AzureSentinelSIEMAttackMap)
- Microsoft Sentinel (SIEM) was used to monitor failed RDP login attempts from global attackers on an exposed Windows 10 VM configured in Microsoft Azure.
- A custom log file was generated using a PowerShell script that extracts failed login events from Event Viewer Security Log and forwards them to a third-party API to get geolocation data.
- A custom table was created in Log Analytics Workspace on Azure using the generated log file, and the table was queried to extract custom fields using Kusto Query Language (KQL).
- A workbook was created in Microsoft Sentinel (SIEM) using KQL to display global attacks (RDP login failure) on the world map according to physical location and magnitude (attack count).

## [Detection & Response with LimaCharlie (EDR)](https://github.com/robsann/LimaCharlieEDRTelemetry)
- Configured in VirtualBox:
    - Windows 11 (Target) with Windows Defender disabled, Sysmon and LimaCharlie (EDR) Sensor installed
    - Ubuntu Server (Attack) with Sliver installed, a Command & Control (C2) framework by BishopFox.
- Generated in Sliver a C2 payload, executed the payload on the Target Machine, and started a Sliver C2 session on the Attack Machine.
- Used the Sliver C2 session to perform two attacks on Target Machine:
    - LSASS access (credentials stealing attack).
    - Shadow Copies deletion using vssadmin.exe Windows utility (used in Ransomware attacks).
- Created Detection & Response Rules in LimaCharlie (EDR) platform to detect the two previous attacks using the telemetry generated and tested the rules by repeating the attacks.
- 
## Pentesting & Network Security with Snort (IDS/IPS)
- Network IDS/IPS setup using Snort in Ubuntu.
- NMAP scan detection using Snort (NIDS):
    - NMAP Ping Scan, TCP Scan, XMAS Scan, FIN Scan, NULL Scan, and UDP Scan.
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
