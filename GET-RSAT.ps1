#Lord Hagen / olehag04@nfk.no
#Windows 10 RSAT Downloader!


#File location.
$filedir = "c:\installfiles"

if((Test-Path $filedir) -eq 0)
{
    #Creates $filedir, if it dosn't exist.
    mkdir $filedir
    Clear-Host

    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "Created folder '$filedir'" -ForegroundColor Green
    Write-Host ""
    Write-Host ""
    Write-Host ""

    Start-Sleep -s 2.5
    Clear-Host
}

import-module bitstransfer

#Remote Server Administration Tools download location.
$RSATx64_url = 'https://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-RSAT_WS2016-x64.msu'
$RSATx86_url = 'https://download.microsoft.com/download/1/D/8/1D8B5022-5477-4B9A-8104-6A71FF9D98AB/WindowsTH-RSAT_WS2016-x86.msu'

if([environment]::Is64BitOperatingSystem -eq $True )
{
    $RSAT_url = $RSATx64_url
    Write-Host "Downloading 64Bit Version!" -ForegroundColor Green
}
else
{
    $RSAT_url = $RSATx86_url
    Write-Host "Downloading 32Bit Version!" -ForegroundColor Green
}


#Downloads file and puts it in $filedir.

$start_time = Get-Date

Start-BitsTransfer -Source $RSAT_url -Destination $filedir
Clear-Host
Write-Host
Write-Host
Write-Host "File downloaded to: $filedir, " -NoNewline
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
Write-Host

#Press a button to exit
Write-Host ""
Write-Host "Press any button to exit..." -ForegroundColor Yellow
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
