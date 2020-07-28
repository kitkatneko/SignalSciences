Invoke-WebRequest -uri "https://dl.signalsciences.net/sigsci-module-iis/sigsci-module-iis_latest.msi" -OutFile C:\Apps\sigsci\module\sigsci-module-iis_latest.msi 
sleep 60
stop-service w3svc
iisreset /stop
msiexec /i C:\Apps\sigsci\module\sigsci-module-iis_latest.msi 
sleep 60
iisreset /start
start-service w3svc
sleep 30
stop-service sigsci-agent
start-service sigsci-agent
sleep 30
iisreset
