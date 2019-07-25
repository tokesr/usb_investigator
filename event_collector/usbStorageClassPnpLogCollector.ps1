$outputFile = "usbStorageClassPnpLogCollector.xml"
$ErrorActionPreference = "SilentlyContinue"

# Class PnP related logs: 507



$Filter = @{
    logname='Microsoft-Windows-Storage-ClassPnP/Operational' 
    id=507
    StartTime =  [datetime]::Today.AddDays(-30)
    EndTime = [datetime]::Today.AddDays(1)
}

$events = Get-WinEvent -FilterHashtable $Filter
$finalXml = "<Events>"


ForEach ($event in $events){
    $finalXml += $event.ToXml()
    }


$finalXml += "</Events>"
$finalXml | Out-File $outputFile

