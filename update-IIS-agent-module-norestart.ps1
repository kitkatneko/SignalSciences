# Prereqs
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
mkdir c:\apps\sigsci\agent
mkdir c:\apps\sigsci\module

# Script to "auto" update the Signal Sciences Agent
Invoke-WebRequest -uri "https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.msi" -OutFile C:\Apps\sigsci\agent\sigsci-agent_latest.msi
msiexec /i C:\Apps\sigsci\agent\sigsci-agent_latest.msi

# Script to "auto" update the Signal Sciences IIS Module
Invoke-WebRequest -uri "https://dl.signalsciences.net/sigsci-module-iis/sigsci-module-iis_latest.msi" -OutFile C:\Apps\sigsci\module\sigsci-module-iis_latest.msi 
msiexec /i C:\Apps\sigsci\module\sigsci-module-iis_latest.msi 

