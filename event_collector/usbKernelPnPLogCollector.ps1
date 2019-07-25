$outputFile = "usbKernelPnPLogCollector.xml"

# Kernel-PnP Configuration events: 400,410,430
$Filter = @{
    logname='Microsoft-Windows-Kernel-PnP/Configuration' 
    id=400,410,430
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