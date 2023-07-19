# Hi, I'm Robson!

I'm a self-taught Cybersecurity learner with interest in cyber defence topics such as Network Security, Endpoint Protection, Vulnerability Management, Incident Response, Threat Intelligence, Threat Hunting, Malware Analysis, and Web Application Security.

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
- Configured Elastic 8 on Ubuntu Server:
    - Elastic Stack: Elasticsearch, Kibana (UI), and Integrations.
    - Integrations Fleet Server, Elastic Agent, System, Windows, and Elastic Defend.
    - Added Fleet Server (Ubuntu Server) and Agent (Windows 10) using Elastic Agent.
- Simulated tests:
    - EICAR Malware Test.
    - MITRE ATT&CK Test with Red Team Automation (RTA).

## [Microsoft Sentinel (SIEM) Attack Map](https://github.com/robsann/AzureSentinelSIEMAttackMap)
- Configured an exposed Windows 10 VM in Azure to monitor failed RDP login attempts from Global Attackers using Microsoft Sentinel (SIEM).
- Windows 10 VM has Firewall disabled and RDP port (3389) open. A custom PowerShell script extracted failed login events from the Event Viewer's Security Log, forwarded them to a third-party API to get geolocation data, and generated a log file with geolocation and event data.
- Created a custom table in Log Analytics Workspace on Azure using the previously generated log file containing geographic information (latitude, longitude, state, and country) and event information (workstation name, account name, and IP address) and queried the table to extract custom fields from RawData using Kusto Query Language (KQL).
- Configured a Microsoft Sentinel (SIEM) workbook to display Global Attackers' data (failed RDP login attempts) on the world map according to physical location and magnitude (count) of attacks using Kusto Query Language (KQL) to query the data from the table created in Log Analytics Workspace.

## [LimaCharlie (EDR) Telemetry](https://github.com/robsann/LimaCharlieEDRTelemetry)
- Windows 11 (Target) with Virus & Threat Protection disabled, Sysmon and LimaCharlie (EDR) Sensor installed.
- Ubuntu Server (Attack) with Sliver, a Command & Control (C2) framework by BishopFox.
- Generated C2 payload, executed payload from Target Machine, and started C2 session on Attack Machine.
- Used C2 session to perform two attacks on Target Machine: LSASS access and Shadow Copies deletion using `vssadmin.exe`.
- Create Detection & Response Rules in LimaCharlie (EDR) to detect the two previous attacks using the events generated by them.
- Test the two Detection & Response Rules by performing the attacks again.

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
