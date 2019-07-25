$outputFile = "usbSystemLogCollector.xml"

# System: DriverFramework-Usermode events: 10000,10001,10002,10100
# System: UserPNP events: 20001,20002,20003
# System: WPD-ClassInstaller: 24576,24577,24578,24579

$Filter = @{
    logname='system' 
    id=10000,10001,10002,10100,20001,20002,20003,24576,24577,24578,24579
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