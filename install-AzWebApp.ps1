  
# Install the Signal Science agent and monitor on an Azure Web App
# https://docs.signalsciences.net/install-guides/paas/azure-app-service/
# use POSH, duh!

#Vars
$TargetRG = "yourRG"
$ACCESSKEYID = "yourKey"
$SECRETACCESSKEY = "yourKey"

# Loop through the web apps
$webapps=(az webapp list -o tsv -g $TargetRG --query "[].name")
foreach ($webapp in $webapps) {
  # Set the settings
  Write-Output "working on "$webapp
  az webapp config appsettings set -g $TargetRG --name $webapp --settings  SIGSCI_ACCESSKEYID=$ACCESSKEYID
  az webapp config appsettings set -g $TargetRG --name $webapp --settings  SIGSCI_SECRETACCESSKEY=$SECRETACCESSKEY  
  
  # Stop the web app
  az webapp stop -g $TargetRG --name $webapp

  # install the extension if not already there
  $sigsciExtension = Get-AzureRmResource -ResourceType "Microsoft.Web/sites/siteextensions" -ResourceGroupName $TargetRG -Name $webapp -ApiVersion "2018-02-01"
  if (($null -eq $sigsciExtension) -or (-not $sigsciExtension.Properties.id.Contains("SignalSciences"))) {
    New-AzureRmResource -ResourceType "Microsoft.Web/sites/siteextensions" -ResourceGroupName $TargetRG -Name $webapp"/SignalSciences.Azure.Site.Extension" -ApiVersion "2018-02-01" -Force
    }
    else {
      Write-Host "Sig Sci WAF extension already installed"
    }
  # Start the web app
  az webapp start -g $TargetRG --name $webapp
}

