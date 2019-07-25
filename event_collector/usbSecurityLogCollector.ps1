$outputFile = "usbSecurityLogCollector.xml"
$ErrorActionPreference = "SilentlyContinue"

# PnP detailed tracking logs: 6416
# Object access audit events: 4656,4663,4658,4690



$Filter = @{
    logname='Security' 
    id=6416,4656,4663,4658,4690
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

