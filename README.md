# Hi, I'm Robson!

I am a self-taught cybersecurity learner interested in cyber defense topics such as, but not limited to, network security, endpoint protection, log analysis, incident response, threat intelligence, threat hunting, vulnerability management, malware analysis, and web applications Security.

---

# Badges & Skills
[<img src="https://tryhackme-badges.s3.amazonaws.com/robsann.png" alt="TryHackMe">](https://tryhackme.com/p/robsann)

---

# [Learning Paths & Courses Credentials](https://github.com/robsann/robsann/blob/main/courses.md)

---

# Cybersecurity Homelabs
## [Threat Hunting with Elastic Stack 8 (XDR)](https://github.com/robsann/ElasticStackLab)
- Configured in VirtualBox:
    - DHCP Server
    - Ubuntu Server (Elastic Host)
    - Windows 10 (Victim)
- Configured Elastic Stack 8 on Ubuntu Server:
    - Elastic Stack: Elasticsearch, Kibana (UI), and Elastic Agent + Integrations.
    - Integrations: Fleet Server, System, Windows, and Elastic Defend.
- Simulated two malicious tests:
    - EICAR Malware Test.
    - MITRE ATT&CK Test with Red Team Automation (RTA).

## [Detection & Response with LimaCharlie (EDR)](https://github.com/robsann/LimaCharlieEDRTelemetry)
- Configured in VirtualBox:
    - A Windows 11 (target) with Windows Defender disabled, Sysmon and LimaCharlie sensor installed.
    - A Ubuntu Server (attack) with Sliver installed, a Command & Control (C2) framework by BishopFox.
- Generated in Sliver a C2 payload and executed the payload on the target machine to start a Sliver C2 session on the attack machine.
- Used the Sliver C2 session to perform two attacks on the target machine:
    - LSASS access (credential stealing attack).
    - Volume shadow copies deletion using vssadmin Windows utility (used in ransomware attacks).
- Detection and response rules were created in the LimaCharlie platform to detect the two previous attacks and take action. The rules were tested by repeating the attacks.

## [Attack Monitoring with Microsoft Sentinel (SIEM)](https://github.com/robsann/AzureSentinelSIEMAttackMap)
- Microsoft Sentinel was used to monitor failed RDP login attempts from global attackers on an exposed Windows 10 virtual machine configured in Microsoft Azure.
- A custom log file (`failed_rdp.log`) was generated using a PowerShell script that extracts failed login events from Security Log on Event Viewer and forwards them to a third-party API to get geolocation data.
- A custom table (`FAILED_RDP_WITH_GEO_CL`) was created in Log Analytics Workspace on Microsoft Azure using the generated log file (`failed_rdp.log`). Custom fields were extracted from the table using a Kusto Query Language (KQL) query.
- A workbook was created in Microsoft Sentinel using KQL to query data from the `FAILED_RDP_WITH_GEO_CL` table to display global attackers (RDP login failure) on the world map according to physical location and magnitude (attack count).

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
