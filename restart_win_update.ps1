# This script checks if the Windows Update service is preventing a PC from going to sleep and if it is will restart
# the Windows Update service.

# If the command 'powercfg -requests' returns the following, then this means that Windows Update service is preventing the PC from going to sleep
#
#[PROCESS] \Device\HarddiskVolume6\Windows\System32\MoUsoCoreWorker.exe
#

$output = powercfg -requests  

if($output[10].Contains('MoUsoCoreWorker.exe')) {
     Write-Host 'Restart required'
     Restart-Service -DisplayName "Windows Update"
} else {
     Write-Host 'Restart not required'
}