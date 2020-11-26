# Script to "auto" update the Signal Sciences Agent
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -uri "https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.msi" -OutFile C:\Apps\sigsci\agent\sigsci-agent_latest.msi
C:\Apps\sigsci\agent\sigsci-agent_latest.msi /quiet
sleep 60
stop-service sigsci-agent
start-service sigsci-agent
sleep 30
iisreset
