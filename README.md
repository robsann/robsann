<div align="justify">
    
# Hi, I'm Robson!
I'm a self-taught Cyber Security learner interested in Cyber Defense topics such as network and endpoint security, traffic and log analysis, digital forensics and incident response, threat hunting, threat intelligence, malware analysis, web applications security, and vulnerability management.

# Badges & Skills
[<img src="https://tryhackme-badges.s3.amazonaws.com/robsann.png" alt="TryHackMe">](https://tryhackme.com/p/robsann)

# Learning Paths & Courses Certificates
I've been using Linkedin Learning to learn Cyber Security topics and tools and TryHackMe to get hands-on practice with offensive and defensive tools and techniques. I also used DataCamp to learn Python and Data Analysis.

<div align="center">

| [Linkedin Learning](https://github.com/robsann/robsann/blob/main/courses.md#linkedin-learning)            | [TryHackMe](https://github.com/robsann/robsann/blob/main/courses.md#tryhackme)                  | [DataCamp](https://github.com/robsann/robsann/blob/main/courses.md#datacamp)                  |
|-----------------------------|----------------------------|---------------------------|
| 25 Learning Paths Completed | 8 Learning Paths Completed | 2 Career Tracks Completed |
| 200 Courses Completed       | 30 Modules Completed       | 1 Skill Track Completed   |
|                             | 172 Rooms Completed        | 3 Projects Completed      |
|                             |                           | 35 Courses Completed      |
| 374+ hours of learning      | 370+ hours of learning     | 140+ hours of learning    |

(Learning paths and courses completed with total time estimated by the platforms)


<!-- <img src="images/wordcloud.png" title="Wordcloud"/> -->

<!-- (Word cloud of [courses.md](https://github.com/robsann/robsann/blob/main/courses.md) generated by [wordclouds](https://www.wordclouds.com/)) -->
</div>

---

# Cyber Security Projects/Homelabs
I've been exploring some homelabs described in Youtube channels and blogs in topics such as threat hunting (XDR), endpoint security (EDR), monitoring (SIEM), and network security (IDS/IPS)

## Threat Hunting with Elastic Stack 8 (XDR) - [GitHub repository](https://github.com/robsann/ElasticStackLab)
- Configured in VirtualBox an Internal Network with:
    - DHCP Server
    - Ubuntu Server (Elastic Host)
    - Windows 10 (Victim)
- Configured Elastic Stack 8 on Ubuntu Server:
    - Elastic Stack: Elasticsearch, Kibana (UI), and Elastic Agent + Integrations.
    - Integrations: Fleet Server, System, Windows, and Elastic Defend.
- Simulated two malicious tests on Victim machine:
    - EICAR Malware Test.
    - MITRE ATT&CK Test with Red Team Automation (RTA).

## Detection & Response with LimaCharlie (EDR) - [GitHub repository](https://github.com/robsann/LimaCharlieEDRTelemetry)
- Configured in VirtualBox a NAT Network with:
    - DHCP Server and Host Gateway access.
    - Windows 11 (Target) with Windows Defender disabled, Sysmon and LimaCharlie sensor installed.
    - Ubuntu Server (Attack) with Sliver installed, a Command & Control (C2) framework by BishopFox.
- Generated in Sliver a C2 payload and executed the payload on the Target machine to start a Sliver C2 session on the Attack machine.
- Used the Sliver C2 session to perform two attacks on the Target machine:
    - LSASS access (credential-stealing attack).
    - Volume shadow copies deletion using vssadmin Windows utility (used in ransomware attacks).
- Detection and response rules were created in the LimaCharlie platform to detect the two previous attacks and take action. The rules were tested by repeating the attacks.

## Attack Monitoring with Microsoft Sentinel (SIEM) - [GitHub repository](https://github.com/robsann/AzureSentinelSIEMAttackMap)
- Microsoft Sentinel was used to monitor failed RDP login attempts from global attackers on an exposed Windows 10 virtual machine configured in Microsoft Azure.
- A custom log file (`failed_rdp.log`) was generated using a PowerShell script that extracts failed login events from Security Log on Event Viewer and forwards them to a third-party API to get geolocation data.
- A custom table (`FAILED_RDP_WITH_GEO_CL`) was created in Log Analytics Workspace on Microsoft Azure using the generated log file (`failed_rdp.log`). Custom fields were extracted from the table using a Kusto Query Language (KQL) query.
- A workbook was created in Microsoft Sentinel using KQL to query data from the `FAILED_RDP_WITH_GEO_CL` table to display global attackers (RDP login failure) on the world map according to physical location and magnitude (attack count).

## Network Security with Snort (IDS/IPS) - [GitHub repository](https://github.com/robsann/NetworkSecurityWithSnort)
- Snort network IDS mode configuration in Ubuntu Server.
- NMAP scan detection using Snort (NIDS):
    - NMAP Ping Scan, various TCP scans including SYN, Connect, NULL, FIN, and XMAS, as well as UDP Scans.
- Attack detection using Snort (NIDS):
    - SQL injection attacks using tools like WPSCan & WordPress and Burp Suite & SQLmap.
    - Backdoor attacks using Empire post-exploitation framework and Katana penetration test framework.
    - Rogue DHCP & Rogue Routing attacks.
    - ICMP Redirect attack.

---

# Cyber Security Fundamentals

I'm developing materials covering IT fundamentals like system administration and networking, as well as cyber security fundamentals. To start, I created visual maps to outline the content of certification exams including CompTIA A+, CompTIA Linux+, CompTIA Network+, CompTIA Security+, and CompTIA CySA+ to start with. You can access these maps in PDF format on Dropbox by clicking on the images.

## System Administration

### CompTIA A+ Core 2 (220-1102) Objectives - [CompTIA link](https://partners.comptia.org/docs/default-source/resources/comptia-a-220-1102-exam-objectives-(3-0))
[<img src="images/CompTIA_A+_Core_2_Legal.png" height="180" width="140" align="left">](https://www.dropbox.com/scl/fi/uv0l09lze1628ddfieiw1/CompTIA_A-_Core_2_Legal.pdf?rlkey=irlacb52g04g3fsq3mtzylmzm&dl=0)
### Exam Domains
<li><img src="https://placehold.co/15x15/6e2a8d/6e2a8d.png"> <b><code>1.0</code> Operating Systems</b></li>
<li><img src="https://placehold.co/15x15/f36c23/f36c23.png"> <b><code>2.0</code> Security</b></li>
<li><img src="https://placehold.co/15x15/0090ba/0090ba.png"> <b><code>3.0</code> Software Troubleshooting</b></li>
<li><img src="https://placehold.co/15x15/00ae4f/00ae4f.png"> <b><code>4.0</code> Operational Procedures</b></li>
<br/>

### CompTIA Linux+ (xk0-005) Objectives - [CompTIA link](https://partners.comptia.org/docs/default-source/resources/comptia-linux-xk0-005-exam-objectives-(1-0))
[<img src='images/CompTIA_Linux+_Legal.png' height="180" width="140" align="left">](https://www.dropbox.com/scl/fi/u677w6em8zl52n5gkp4hx/CompTIA_Linux-_Legal.pdf?rlkey=bew7k8mm9nxyxes43spxmhk6f&dl=0)
### Exam Domains
<li><img src="https://placehold.co/15x15/6e2a8d/6e2a8d.png"> <b><code>1.0</code> System Management</b></li>
<li><img src="https://placehold.co/15x15/f36c23/f36c23.png"> <b><code>2.0</code> Security</b></li>
<li><img src="https://placehold.co/15x15/0090ba/0090ba.png"> <b><code>3.0</code> Scripting, Containers, and Automation</b></li>
<li><img src="https://placehold.co/15x15/5fa511/5fa511.png"> <b><code>4.0</code> Troubleshooting</b></li>
<br/>

## Network Administration

### CompTIA Network+ (n10-008) Objectives - [CompTIA link](https://partners.comptia.org/docs/default-source/resources/comptia-network-n10-008-exam-objectives-(2-0))
[<img src='images/CompTIA_Network+_Legal.png' height="210" width="140" align="left">](https://www.dropbox.com/scl/fi/9ahsruoiweigfj1qth5bp/CompTIA_Network-_Legal.pdf?rlkey=0kb5fz8d8s79ked4bzzpgeurv&dl=0)
### Exam Domains
<li><img src="https://placehold.co/15x15/9c40a6/9c40a6.png"> <b><code>1.0</code> Networking Fundamentals</b></li>
<li><img src="https://placehold.co/15x15/f2581c/f2581c.png"> <b><code>2.0</code> Network Implementations</b></li>
<li><img src="https://placehold.co/15x15/0b90bf/0b90bf.png"> <b><code>3.0</code> Network Operations</b></li>
<li><img src="https://placehold.co/15x15/b5da17/b5da17.png"> <b><code>4.0</code> Network Security</b></li>
<li><img src="https://placehold.co/15x15/004e72/004e72.png"> <b><code>5.0</code> Network Troubleshooting</b></li>
<br/>

## Cyber Security

### CompTIA Security+ (SY0-501) Objectives - [CompTIA link](https://www.comptia.jp/pdf/Security%2B%20SY0-501%20Exam%20Objectives.pdf)
[<img src='images/CompTIA_Security+_Legal.png' height="240" width="140" align="left">](https://www.dropbox.com/scl/fi/v0dp6408dvzowwupmh0o8/CompTIA_Security-_Legal.pdf?rlkey=bb0h1xnubn41qvq0obi5m08sk&dl=0)
### Exam Domains
<li><img src="https://placehold.co/15x15/0b90bf/0b90bf.png"> <b><code>1.0</code> Threats, Attacks and Vulnerabilities</b></li>
<li><img src="https://placehold.co/15x15/b5da17/b5da17.png"> <b><code>2.0</code> Technologies and Tools</b></li>
<li><img src="https://placehold.co/15x15/f2581c/f2581c.png"> <b><code>3.0</code> Architecture and Design</b></li>
<li><img src="https://placehold.co/15x15/004e72/004e72.png"> <b><code>4.0</code> Identity and Access Management</b></li>
<li><img src="https://placehold.co/15x15/62a70f/62a70f.png"> <b><code>5.0</code> Risk Management</b></li>
<li><img src="https://placehold.co/15x15/f4a00f/f4a00f.png"> <b><code>6.0</code> Cryptography and PKI</b></li>
<br/>

### CompTIA Cybersecurity Analyst (CySA+) (CS0-003) Objectives - [CompTIA link](https://partners.comptia.org/docs/default-source/resources/comptia-cysa-cs0-003-exam-objectives-2-0.pdf)
[<img src='images/CompTIA_CySA+_Legal.png' height="180" width="140" align="left">](https://www.dropbox.com/scl/fi/5vt0e27y6buj902nbz0wu/CompTIA_CySA-_Legal.pdf?rlkey=yhogwiipsb8nykzaeeru4l7tr&dl=0)
### Exam Domains
<li><img src="https://placehold.co/15x15/6e2a8d/6e2a8d.png"> <b><code>1.0</code> Security Operations</b></li>
<li><img src="https://placehold.co/15x15/f36c23/f36c23.png"> <b><code>2.0</code> Vulnerability Management</b></li>
<li><img src="https://placehold.co/15x15/0090ba/0090ba.png"> <b><code>3.0</code> Incident Response and Management</b></li>
<li><img src="https://placehold.co/15x15/f1a91e/f1a91e.png"> <b><code>4.0</code> Reporting and Communication</b></li>
<br/>

### Cyber Security Domains Mind Map from 2017 (credits to [MyDFIR](https://www.youtube.com/@MyDFIR))
<img src='images/Cybersecurity_Mind_Map.png' align="center">

</div>



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
