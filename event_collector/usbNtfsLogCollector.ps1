$outputFile = "usbNtfsLogCollector.xml"

# NTFS logs: 142,145

$Filter = @{
    logname='Microsoft-Windows-Ntfs/Operational' 
    id=142,145
    StartTime =  [datetime]::Today.AddDays(-30)
    EndTime = [datetime]::Today.AddDays(1)
}

$events = Get-WinEvent -FilterHashtable $Filter -ErrorAction SilentlyContinue
$finalXml = "<Events>"

ForEach ($event in $events){
    $finalXml += $event.ToXml()
    }


$finalXml += "</Events>"
$finalXml | Out-File $outputFile