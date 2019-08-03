$outputFile = "usbDriverFrameworkLogCollector.xml"
$ErrorActionPreference = "SilentlyContinue"

# DriverFw preconnection: 1003,2000,2001,1004
# DriverFw connection-related logs: 2003,2010,2004,2006,2100,2105,2106,2101,2102
# DriverFw removal-related logs: 1006,2900,2901,1008


$Filter = @{
    logname='Microsoft-Windows-DriverFrameworks-UserMode/Operational' 
    id=1003,2000,2001,1004,2003,2010,2004,2006,2100,2105,2106,2101,2102,1006,2900,2901,1008
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

