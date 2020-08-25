  
# Install the Signal Science agent and monitor on an Azure Web App
#https://docs.signalsciences.net/install-guides/paas/azure-app-service/

#Vars
$TargetRG = "dcac-sitecore-rg"
$TargetWebApp = "YourWebApp"
$ACCESSKEYID = "yourkey"
$SECRETACCESSKEY = "yourkey"

# Loop through the web apps
Get-AzWebApp -ErrorAction Ignore -PipelineVariable webapp -ResourceGroupName $TargetRG | where {$webapp.HttpsOnly -ne $true} | foreach {
  # Set the settings
  $webapp | set-azwebapp #--settings  SIGSCI_ACCESSKEYID=$ACCESSKEYID
}

