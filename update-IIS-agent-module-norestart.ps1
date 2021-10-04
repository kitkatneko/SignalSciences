$AgentPath = "c:\apps\sigsci\agent"
$ModulePath = "c:\apps\sigsci\module"
# Prereqs
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
if (test-path $AgentPath) {} else {New-Item -Path $AgentPath -ItemType Directory}
if (test-path $ModulePath) {} else {New-Item -Path $ModulePath -ItemType Directory}

# Script to "auto" update the Signal Sciences Agent
Invoke-WebRequest -uri "https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.msi" -OutFile C:\Apps\sigsci\agent\sigsci-agent_latest.msi
msiexec /i C:\Apps\sigsci\agent\sigsci-agent_latest.msi /qn

# Wait for it...
sleep 60

# Script to "auto" update the Signal Sciences IIS Module
Invoke-WebRequest -uri "https://dl.signalsciences.net/sigsci-module-iis/sigsci-module-iis_latest.msi" -OutFile C:\Apps\sigsci\module\sigsci-module-iis_latest.msi 
msiexec /i C:\Apps\sigsci\module\sigsci-module-iis_latest.msi /qn

