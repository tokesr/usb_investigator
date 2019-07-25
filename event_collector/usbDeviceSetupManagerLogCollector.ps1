$outputFile = "usbDeviceSetupManagerLogCollector.xml"
$ErrorActionPreference = "SilentlyContinue"

# Device Setup Manager logs: 100,101,112



$Filter = @{
    logname='Microsoft-Windows-DeviceSetupManager/Admin' 
    id=100,101,112
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

