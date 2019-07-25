# Collecting every investigated event into an XML file

$outputFile = "usbLogCollector.xml"
$ErrorActionPreference = "SilentlyContinue"


# StorSvc Diagnostic logs: 1002
# Class PnP related logs: 507
# PnP detailed tracking logs: 6416
# Object access audit events: 4656,4663,4658,4690
# Partition Diagnostic event: 1006
# NTFS logs: 142,145
# Kernel-PnP Configuration events: 400,410,430
# Device Setup Manager logs: 100,101,112
# PnP detailed tracking logs: 6416
# Object access audit events: 4656,4663,4658,4690
# DriverFw connection-related logs: 2003,2010,2004,2006,2100,2105,2106,2101,2102
# DriverFw removal-related logs: 1006,2900,2901,1008
# System: DriverFramework-Usermode events: 10000,10001,10002,10100
# System: UserPNP events: 20001,20002,20003
# System: WPD-ClassInstaller: 24576,24577,24578,24579


$logname='System','Security','Microsoft-Windows-DeviceSetupManager/Admin','Microsoft-Windows-DriverFrameworks-UserMode/Operational','Microsoft-Windows-Kernel-PnP/Configuration','Microsoft-Windows-Ntfs/Operational','Microsoft-Windows-Partition/Diagnostic','Microsoft-Windows-Storage-ClassPnP/Operational','Microsoft-Windows-Storsvc/Diagnostic'
$id=100,101,112,1002,507,6416,4656,4663,4658,4690,1006,142,145,400,410,430,6416,4656,4663,4658,4690,2003,2010,2004,2006,2100,2105,2106,2101,2102,1006,2900,2901,1008,10000,10001,10002,10100,20001,20002,20003,24576,24577,24578,24579

$StartTime =  [datetime]::Today.AddDays(-30)
$EndTime = [datetime]::Today.AddDays(1)
 
#the max amount of ID filterhashtable can handle is 22 (23?), so a workaround is needed it you want to use this format  
 for ($i = 0; $i -lt $id.count; $i=$i+21) { 
    [array]$events += Get-WinEvent -FilterHashtable @{logname=$logname; id= $id[$i..($i+21)]}}  
    



$finalXml = "<Events>"


ForEach ($event in $events){
    $finalXml += $event.ToXml()
    }


$finalXml += "</Events>"
$finalXml | Out-File $outputFile