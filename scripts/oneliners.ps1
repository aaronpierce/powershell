function touch($file) { "" | Out-File $file -Encoding ASCII }

function getip($hostname) { [Net.Dns]::GetHostByName($hostname).AddressList.IPAddressToString } 

function gethostname($ip) { [system.net.dns]::GetHostByAddress($ip).hostname }

function ext($file) { [IO.Path]::GetExtension($file) }

function regex($text, $pattern) { [RegEx]::Matches($text, $pattern).Value}

function here { . explorer.exe }

function cdps { Set-Location $PSRoot }

function cdpy { Set-Location $env:USERPROFILE'\Google Drive\Programming\Python' }

function cdcode { Set-Location $env:USERPROFILE'\Google Drive\Programming' }

function pr { . $profile }

function er { & $env:ProgramData'\chocolatey\bin\RefreshEnv.cmd' }