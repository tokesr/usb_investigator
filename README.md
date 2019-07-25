# usb_investigator

This tools is designed to be able to gather USB-related artifacts from Windows machines. Also script is designed to correlate these informations. So far this is only a collector for Windows evtx-based information.

The following sources are going to be checked and collected in the future by the script:

	* Windows events (evtx files)
	* Registry files
	* Other artifacts (LNK files, Recent files, etc)
	* setupAPI.dev.log file
	

Content of event_collector folder:

	* separate Powershell script for each event sources I investigated -> use this if you only want to collect some, but not all of the mentioned events
	* a common owershell script that collects every investigated events named usbLogCollector.ps1 -> use this if you want to collect every events from the related blog post
