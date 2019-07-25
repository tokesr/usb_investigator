$outputFile = "usbStorsvcLogCollector.xml"
$ErrorActionPreference = "SilentlyContinue"

# StorSvc Diagnostic logs: 1002



$Filter = @{
    logname='Microsoft-Windows-Storsvc/Diagnostic' 
    id=1002
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