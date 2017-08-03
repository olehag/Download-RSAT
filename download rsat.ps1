#Lord Hagen / olehag04@nfk.no

import-module bitstransfer

$RSATx64_url = https://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-RSAT_WS2016-x64.msu
$RSATx86_url = https://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-RSAT_WS2016-x86.msu
$fildir = ""

{
    $start_time = Get-Date

    Start-BitsTransfer -Source $RSAT_url -Destination $fildir

    Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

    Start-Sleep -s 3
}