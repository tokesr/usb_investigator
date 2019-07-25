$outputFile = "usbPartitionLogCollector.xml"

# Partition Diagnostic event: 1006

$Filter = @{
    logname='Microsoft-Windows-Partition/Diagnostic' 
    id=1006
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