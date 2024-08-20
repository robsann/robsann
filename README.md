<div align="justify">
    
# Hi, I'm Robson

I have a keen interest in cyber security, with a focus on security operations, including network and endpoint security, log and traffic analysis, malware analysis, threat hunting, digital forensics, incident response, threat intelligence, web applications security, and vulnerability management. I use my GitHub account to curate homelabs to simulate diverse security operations scenarios, which I then use to test SOC tools. Additionally, I create content covering system administration, network administration, and cyber security topics. My certificates can be found [here](https://github.com/robsann/robsann/blob/main/certificates.md).

</div>

# Outline

- [Cyber Security Homelabs](#cyber-security-homelabs)
    - [Threat Hunting with Elastic Stack 8 (XDR)](#elastic-stack)
    - [Detection & Response with LimaCharlie (EDR)](#limacharlie)
    - [Attack Monitoring with Microsoft Sentinel (SIEM)](#microsoft-sentinel)
    - [Network Security with Snort (IDS/IPS)](#snort)
- [IT and Cyber Security Popular Certifications](#it-and-cyber-sec-certs)
    - [System Administration](#system-administration-cert)
    - [Network Administration](#network-administration-cert)
    - [Cyber Security](#cyber-security-cert)
	- [Cyber Security Resources](#cyber-security-resources)
- [IT and Cyber Security Concepts](#it-and-cyber-security-concepts)
    - [SysAdmin Concepts](#sysadmin-concepts)
    - [Networking Concepts](#networking-concepts)
    - [Cyber Security Concepts](#cyber-security-concepts)


----------------------------------------------------------------------------------------------------


<h1 align="center" id="cyber-security-homelabs">Cyber Security Homelabs</h1>

I've been exploring some homelabs described in YouTube channels and blogs on topics such as threat hunting (XDR), endpoint security (EDR), monitoring (SIEM), and network security (IDS/IPS)

<details>
<summary>
<h2 id="elastic-stack">🌱 Threat Hunting with Elastic Stack 8 (XDR)</h2>
</summary>
<span style="color:gray">

- Configured in VirtualBox an Internal Network with:
    - DHCP Server
    - Ubuntu Server (Elastic Host)
    - Windows 10 (Victim)
- Configured Elastic Stack 8 on Ubuntu Server:
    - Elastic Stack: Elasticsearch, Kibana (UI), and Elastic Agent + Integrations.
    - Integrations: Fleet Server, System, Windows, and Elastic Defend.
- Simulated two malicious tests on the Victim machine:
    - EICAR Malware Test.
    - MITRE ATT&CK Test with Red Team Automation (RTA).

**Source:** https://github.com/robsann/ElasticStackLab

</span>
</details>

<details>
<summary>
<h2 id="limacharlie">🌱 Detection & Response with LimaCharlie (EDR)</h2>
</summary>
<span style="color:gray">

- Configured in VirtualBox a NAT Network with:
    - DHCP Server and Host Gateway access.
    - Windows 11 (Target) with Windows Defender disabled, Sysmon and LimaCharlie sensor installed.
    - Ubuntu Server (Attack) with Sliver installed, a Command & Control (C2) framework by BishopFox.
- Generated in Sliver a C2 payload and executed the payload on the Target machine to start a Sliver C2 session on the Attack machine.
- Used the Sliver C2 session to perform two attacks on the Target machine:
    - LSASS access (credential-stealing attack).
    - Volume shadow copies deletion using vssadmin Windows utility (used in ransomware attacks).
- Detection and response rules were created in the LimaCharlie platform to detect the two previous attacks and take action. The rules were tested by repeating the attacks.

**Source:** https://github.com/robsann/LimaCharlieEDRTelemetry

</span>
</details>

<details>
<summary>
<h2 id="microsoft-sentinel">🌱 Attack Monitoring with Microsoft Sentinel (SIEM)</h2>
</summary>
<span style="color:gray">

- Microsoft Sentinel was used to monitor failed RDP login attempts from global attackers on an exposed Windows 10 virtual machine configured in Microsoft Azure.
- A custom log file (`failed_rdp.log`) was generated using a PowerShell script that extracts failed login events from Security Log on Event Viewer and forwards them to a third-party API to get geolocation data.
- A custom table (`FAILED_RDP_WITH_GEO_CL`) was created in Log Analytics Workspace on Microsoft Azure using the generated log file (`failed_rdp.log`). Custom fields were extracted from the table using a Kusto Query Language (KQL) query.
- A workbook was created in Microsoft Sentinel using KQL to query data from the `FAILED_RDP_WITH_GEO_CL` table to display global attackers (RDP login failure) on the world map according to physical location and magnitude (attack count).

**Source:** https://github.com/robsann/AzureSentinelSIEMAttackMap

</span>
</details>

<details>
<summary>
<h2 id="snort">🌱 Network Security with Snort (IDS/IPS)</h2>
</summary>
<span style="color:gray">

- Snort network IDS mode configuration in Ubuntu Server.
- NMAP scan detection using Snort (NIDS):
    - NMAP Ping Scan, various TCP scans including SYN, Connect, NULL, FIN, and XMAS, as well as UDP Scans.
- Attack detection using Snort (NIDS):
    - SQL injection attacks using tools like WPSCan & WordPress and Burp Suite & SQLmap.
    - Backdoor attacks using Empire post-exploitation framework and Katana penetration test framework.
    - Rogue DHCP & Rogue Routing attacks.
    - ICMP Redirect attack.

**Source:** https://github.com/robsann/NetworkSecurityWithSnort

</span>
</details>


----------------------------------------------------------------------------------------------------


<h1 align="center" id="it-and-cyber-sec-certs">IT and Cyber Security Popular Certifications</h1>

A brief overview of popular CompTIA certifications, with mind maps detailing exam domains and links to related YouTube resources is provided here. This includes System Administration and Network Administration certifications such as CompTIA A+, CompTIA Linux+, and CompTIA Network+, as well as Cyber Security certifications like CompTIA Security+ and CompTIA CySA+. You can access these mind maps in high-resolution PDF format on Dropbox by clicking on the images.

<details>
<summary>
<h2 id="system-administration-cert">📝 System Administration Certifications</h2>
</summary>
<span style="color:gray">

### CompTIA A+ Core 2 (220-1102) Objectives - [CompTIA link](https://partners.comptia.org/docs/default-source/resources/comptia-a-220-1102-exam-objectives-(3-0))

The CompTIA A+ Core 2 certification objectives cover advanced troubleshooting, operating systems, security, and software troubleshooting. It includes topics like hardware, networking, mobile devices, virtualization, and cloud computing. Candidates are tested on their ability to secure and manage various devices and technologies, ensuring comprehensive IT skills and knowledge. CompTIA A+ Core 2 demonstrates proficiency in essential IT areas.

[<img src="images/CompTIA_A+_Core_2_Legal.png" height="180" width="140" align="left">](https://www.dropbox.com/scl/fi/uv0l09lze1628ddfieiw1/CompTIA_A-_Core_2_Legal.pdf?rlkey=irlacb52g04g3fsq3mtzylmzm&dl=0)

#### Exam Domains

<li><img src="https://placehold.co/15x15/6e2a8d/6e2a8d.png"> <b><code>1.0</code> Operating Systems</b></li>
<li><img src="https://placehold.co/15x15/f36c23/f36c23.png"> <b><code>2.0</code> Security</b></li>
<li><img src="https://placehold.co/15x15/0090ba/0090ba.png"> <b><code>3.0</code> Software Troubleshooting</b></li>
<li><img src="https://placehold.co/15x15/00ae4f/00ae4f.png"> <b><code>4.0</code> Operational Procedures</b></li>
<br/>

**Professor Messer CompTIA A+ Core 2 (220-1102) course - [YouTube Link](https://www.youtube.com/watch?v=3MHDU4kFChU&list=PLG49S3nxzAnna96gzhJrzkii4hH_mgW4b&ab_channel=ProfessorMesser)**

### CompTIA Linux+ (XK0-005) Objectives - [CompTIA link](https://partners.comptia.org/docs/default-source/resources/comptia-linux-xk0-005-exam-objectives-(1-0))

The CompTIA Linux+ certification validates essential skills in Linux system administration and operation. Covering topics such as system architecture, Linux installation, package management, command line usage, file permissions, and security, this certification ensures proficiency in managing Linux-based systems. Candidates learn troubleshooting, scripting, and networking in a Linux environment, making them well-equipped for various IT roles requiring Linux expertise. Achieving CompTIA Linux+ certification demonstrates a thorough understanding of Linux systems.

[<img src='images/CompTIA_Linux+_Legal.png' height="180" width="140" align="left">](https://www.dropbox.com/scl/fi/u677w6em8zl52n5gkp4hx/CompTIA_Linux-_Legal.pdf?rlkey=bew7k8mm9nxyxes43spxmhk6f&dl=0)

#### Exam Domains

<li><img src="https://placehold.co/15x15/6e2a8d/6e2a8d.png"> <b><code>1.0</code> System Management</b></li>
<li><img src="https://placehold.co/15x15/f36c23/f36c23.png"> <b><code>2.0</code> Security</b></li>
<li><img src="https://placehold.co/15x15/0090ba/0090ba.png"> <b><code>3.0</code> Scripting, Containers, and Automation</b></li>
<li><img src="https://placehold.co/15x15/5fa511/5fa511.png"> <b><code>4.0</code> Troubleshooting</b></li>
<br/>

**Shawn Powers' CompTIA Linux+ (XK0-005) prep (in progress) - [YouTube Link](https://www.youtube.com/watch?v=niPWk7tgD2Q&list=PL78ppT-_wOmuwT9idLvuoKOn6UYurFKCp&ab_channel=ShawnPowers)**

</span>
</details>

<details>
<summary>
<h2 id="network-administration-cert">📝 Network Administration Certifications</h2>
</summary>
<span style="color:gray">

### CompTIA Network+ (N10-008) Objectives - [CompTIA link](https://partners.comptia.org/docs/default-source/resources/comptia-network-n10-008-exam-objectives-(2-0))

The CompTIA Network+ certification validates essential skills in networking, covering topics such as network architecture, security, troubleshooting, and cloud technologies. Candidates learn to design and implement functional networks, configure network devices, and manage network security protocols. The certification also emphasizes practical skills in areas like network installation, configuration, and diagnostics, ensuring proficiency in both wired and wireless networks. Overall, CompTIA Network+ certification demonstrates expertise in network administration.

[<img src='images/CompTIA_Network+_Legal.png' height="210" width="140" align="left">](https://www.dropbox.com/scl/fi/9ahsruoiweigfj1qth5bp/CompTIA_Network-_Legal.pdf?rlkey=0kb5fz8d8s79ked4bzzpgeurv&dl=0)

#### Exam Domains

<li><img src="https://placehold.co/15x15/9c40a6/9c40a6.png"> <b><code>1.0</code> Networking Fundamentals</b></li>
<li><img src="https://placehold.co/15x15/f2581c/f2581c.png"> <b><code>2.0</code> Network Implementations</b></li>
<li><img src="https://placehold.co/15x15/0b90bf/0b90bf.png"> <b><code>3.0</code> Network Operations</b></li>
<li><img src="https://placehold.co/15x15/b5da17/b5da17.png"> <b><code>4.0</code> Network Security</b></li>
<li><img src="https://placehold.co/15x15/004e72/004e72.png"> <b><code>5.0</code> Network Troubleshooting</b></li>
<br/>

**Professor Messer CompTIA Network+ (N10-008) course - [YouTube Link](https://www.youtube.com/watch?v=As6g6IXcVa4&list=PLG49S3nxzAnlCJiCrOYuRYb6cne864a7G)**

</span>
</details>

<details>
<summary>
<h2 id="cyber-security-cert">📝 Cyber Security Certifications</h2>
</summary>
<span style="color:gray">

### CompTIA Security+ (SY0-501) Objectives - [CompTIA link](https://www.comptia.jp/pdf/Security%2B%20SY0-501%20Exam%20Objectives.pdf)

The CompTIA Security+ certification objectives cover essential topics in cybersecurity, including network security, threats and vulnerabilities, access control, identity management, cryptography, and risk management. It also emphasizes security compliance, incident response, and security architecture. Successfully mastering these objectives demonstrates proficiency in securing IT systems.

[<img src='images/CompTIA_Security+_Legal.png' height="240" width="140" align="left">](https://www.dropbox.com/scl/fi/pqs0pm897xufw0f3jzqhd/CompTIA_Security-_Legal.pdf?rlkey=nqhsmt3kgkzq5324dumz3pd99&dl=0)

#### Exam Domains

<li><img src="https://placehold.co/15x15/0b90bf/0b90bf.png"> <b><code>1.0</code> Threats, Attacks and Vulnerabilities</b></li>
<li><img src="https://placehold.co/15x15/b5da17/b5da17.png"> <b><code>2.0</code> Technologies and Tools</b></li>
<li><img src="https://placehold.co/15x15/f2581c/f2581c.png"> <b><code>3.0</code> Architecture and Design</b></li>
<li><img src="https://placehold.co/15x15/004e72/004e72.png"> <b><code>4.0</code> Identity and Access Management</b></li>
<li><img src="https://placehold.co/15x15/62a70f/62a70f.png"> <b><code>5.0</code> Risk Management</b></li>
<li><img src="https://placehold.co/15x15/f4a00f/f4a00f.png"> <b><code>6.0</code> Cryptography and PKI</b></li>
<br/>

**Professor Messer's CompTIA Security+ (SY0-501) course - [YouTube Link](https://www.youtube.com/watch?v=JU5zkddWits&list=PLG49S3nxzAnnVhoAaL4B6aMFDQ8_gdxAy&ab_channel=ProfessorMesser)**

### CompTIA Cybersecurity Analyst (CySA+) (CS0-003) Objectives - [CompTIA link](https://partners.comptia.org/docs/default-source/resources/comptia-cysa-cs0-003-exam-objectives-2-0.pdf)

The CompTIA Cybersecurity Analyst (CySA+) certification focuses on identifying and responding to security threats and vulnerabilities in a cybersecurity context. CySA+ certified professionals demonstrate skills in threat detection, analysis, and response using various tools and techniques. They are proficient in analyzing data to identify vulnerabilities, threats, and risks to an organization's information systems. CySA+ certification validates expertise in cybersecurity operations, enhancing an individual's ability to protect and secure organizational assets against cyber threats.

[<img src='images/CompTIA_CySA+_Legal.png' height="180" width="140" align="left">](https://www.dropbox.com/scl/fi/5vt0e27y6buj902nbz0wu/CompTIA_CySA-_Legal.pdf?rlkey=yhogwiipsb8nykzaeeru4l7tr&dl=0)

#### Exam Domains

<li><img src="https://placehold.co/15x15/6e2a8d/6e2a8d.png"> <b><code>1.0</code> Security Operations</b></li>
<li><img src="https://placehold.co/15x15/f36c23/f36c23.png"> <b><code>2.0</code> Vulnerability Management</b></li>
<li><img src="https://placehold.co/15x15/0090ba/0090ba.png"> <b><code>3.0</code> Incident Response and Management</b></li>
<li><img src="https://placehold.co/15x15/f1a91e/f1a91e.png"> <b><code>4.0</code> Reporting and Communication</b></li>
<br>

</span>
</details>

<details>
<summary>
<h2 id="cyber-security-resources">📝 Cyber Security Resources</h2>
</summary>
<span style="color:gray">

### Cyber Security Domains from 2021 (credits to [MyDFIR](https://www.youtube.com/@MyDFIR))

Mind map from 2021 that provides a comprehensive overview of the various domains within cyber security.

<img src='images/cybersecurity_domains_2021.png' align="center">

### Hands-on Platforms for Cyber Security Operations

- **[LetsDefend](https://letsdefend.io/):** Hands-on security operations training with alert addressing on simulated SOC environment.
- **[CyberDefenders](https://cyberdefenders.org/):** A blue team training platform.
- **[TryHackMe](https://tryhackme.com/):** Hands-on cyber security training with offensive and defensive paths.
- **[HackTheBox](https://www.hackthebox.com/):** Hands-on cyber security training with offensive and defensive paths.
</div>

</span>
</details>


----------------------------------------------------------------------------------------------------


<h1 align="center" id="it-and-cyber-security-concepts">IT and Cyber Security Concepts</h1>

<details>
<summary>
<h2 id="sysadmin-concepts">💾 SysAdmin Concepts</h2>
</summary>
<span style="color:gray">

### Linux File System

The Linux File System is a hierarchical structure that organizes and stores files on a Linux system. It uses a tree-like directory structure, starting with the root directory ("/"), with directories and files arranged systematically to facilitate efficient file management and access.

<div align="center">
<img src='images/linux_file_system.png' width="50%">
</div>
<br>

### Linux File Permissions

Linux File Permissions dictate the access level of users (owner, group, and others) to files and directories. They are represented by read, write, and execute permissions, providing control over file security and user interactions.

<div align="center">
<img src='images/linux_file_permissions.png' width="75%">
</div>
<br>

### Linux Useful Commands

Linux commands help users navigate the file system, interact with the files, and administer the entire system using the command line interface.

**Note:** Use the `man` command to display the manual page for other commands (e.g., `man ls`), providing detailed documentation and usage instructions, or use the `--help` option (e.g., `ls --help`) for a quick overview of the command options.

<div align="center">
<img src='images/linux_commands.png' width="75%">
</div>
<br>

### Linux Useful Files

- **Configuration files (/etc/)** store system-wide settings, preferences, and configurations for various applications, facilitating centralized management.
- **System Info files (/proc/)** provide a virtual file system exposing kernel and process information, allowing dynamic access to real-time system details and parameters.
- **Log files (/var/log/)** store system and application logs, aiding in troubleshooting by capturing events, errors, and diagnostic information for analysis and monitoring.

<div align="center">
<img src='images/linux_files_and_logs.png' width="75%">
</div>
<br>

</span>
</details>

<details>
<summary>
<h2 id="networking-concepts">💾 Networking Concepts</h2>
</summary>
<span style="color:gray">

### OSI Model

The Open Systems Interconnection (OSI) model is a conceptual framework used to describe how network communications work. The OSI model characterizes computing functions into a universal set of rules and requirements in order to support interoperability between different products and software.

<div align="center">
<img src='images/osi_model.png'>
</div>
<br>

### TCP vs UDP

TCP (Transmission Control Protocol) is a connection-oriented and reliable transport layer protocol, that ensures data integrity and ordered delivery. UDP (User Datagram Protocol) is a connectionless and lightweight transport layer protocol that sacrifices reliability for reduced latency, making it suitable for real-time applications where occasional data loss is acceptable.

<div align="center">
<img src='images/tcp_vs_udp.png' width="75%">
</div>
<br>

### DHCP

The Dynamic Host Configuration Protocol (DHCP) is a network management protocol used on IP networks that in 4 steps, automatically assigns IP addresses and other communication parameters to devices connected to the network using a client-server architecture.

<div align="center">
<img src='images/dhcp.png' width="75%">
</div>
<br>

### DNS

The Domain Name System (DNS) is a naming database that translates human-readable domain names (e.g., www.example.com) to machine-readable IP addresses (e.g., 93.184.216.34) used for device communication. If the website is not cached, the DNS resolver will query Root Servers, Top-Level Domain (TLD) Servers, and Authoritative Nameservers to retrieve the IP address.

<div align="center">
<img src='images/dns.png' width="75%">
</div>
<br>

</span>
</details>

<details>
<summary>
<h2 id="cyber-security-concepts">💾 Cyber Security Concepts</h2>
</summary>
<span style="color:gray">

### The CIA Triad

The CIA Triad is a fundamental concept in information security, representing the core principles of **Confidentiality** (ensuring data privacy), **Integrity** (maintaining data accuracy and trustworthiness), and **Availability** (ensuring data accessibility). These principles guide security measures and strategies to protect information assets in various computing environments.

<div align="center">
<img src='images/cia_triad.png' width="75%">
</div>
<br>

### The Cyber Kill Chain

The Cyber Kill Chain is a framework outlining the stages of a cyber attack, from initial reconnaissance to achieving the attacker's objectives, providing a structured approach for understanding, analyzing, and defending against advanced cyber threats.

<div align="center">
<img src='images/cyber_kill_chain.png' width="75%">
</div>
<br>

### MITRE ATT&CK Matrix

[MITRE ATT&CK (Adversarial Tactics, Techniques, and Common Knowledge)](https://attack.mitre.org/) is a knowledge base that catalogs and describes the tactics, techniques, and procedures used by cyber adversaries. It provides a comprehensive framework for understanding and analyzing the full spectrum of cyber threats, aiding organizations in improving their detection, defense, and response capabilities.

<div align="center">
<img src='images/mitre_att&ck.png' width="100%">
</div>
<br>

### Pyramid of Pain

The Pyramid of Pain is a conceptual framework in cybersecurity that categorizes indicators of compromise (IOCs) in six levels based on the difficulty for adversaries to change or evade detection. The pyramid is structured in ascending order of difficulty, as illustrated below:

<div align="center">
<img src='images/pyramid_of_pain.png' width="75%">
</div>
<br>

### SOC Technologies

Security Operations Center (SOC) technologies encompass a range of tools designed to monitor, analyze, and respond to cyber security threats. These include SIEM for log analysis, EDR for endpoint protection, SOAR for orchestration, and other solutions that collectively fortify an organization's cyber security posture.

<div align="center">
<img src='images/soc_technologies.png' width="75%">
</div>
<br>

### NIST Incident Response Framework

The NIST Incident Response Framework provides a systematic approach for organizations to prepare for, detect, respond to, and recover from cybersecurity incidents. It guides the development of robust incident response capabilities through a four-phase process: preparation, detection and analysis, containment, eradication, recovery, and post-incident activity.

<div align="center">
<img src='images/nist_ir.png' width="75%">
</div>
<br>

### SANS Incident Response Framework

The SANS Incident Response Framework provides a structured approach for organizations to effectively respond to cybersecurity incidents, comprising six key phases: Preparation, Identification, Containment, Eradication, Recovery, and Lessons Learned. It guides the development of robust incident response capabilities to detect, mitigate, and recover from security incidents.

<div align="center">
<img src='images/sans_ir.png' width="75%">
</div>
<br>

</span>
</details>

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
