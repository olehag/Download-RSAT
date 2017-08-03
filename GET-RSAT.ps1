#Lord Hagen / olehag04@nfk.no

import-module bitstransfer

#Remote Server Administration Tools, download location.
$RSATx64_url = 'https://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-RSAT_WS2016-x64.msu'
$RSATx86_url = 'https://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-RSAT_WS2016-x86.msu'

if([environment]::Is64BitOperatingSystem -eq $True )
{
    $RSAT_url = $RSATx64_url
}
else
{
    $RSAT_url = $RSATx86_url
}

#File location.
$filedir = ''

#Downloads file and puts it in $filedir.

$start_time = Get-Date

Start-BitsTransfer -Source $RSAT_url -Destination $filedir

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

Start-Sleep -s 2
