# prompt customization coming from the following:
# http://winterdom.com/2008/08/mypowershellprompt
function shortenpath([string] $path) { 
    $loc = $path.Replace($HOME, '~') 
    # remove prefix for UNC paths 
    $loc = $loc -replace '^[^:]+::', '' 
    # make path shorter like tabs in Vim, 
    # handle paths starting with \\ and . correctly 
    return ($loc -replace '\\(\.?)([^\\])[^\\]*(?=\\)','\$1$2') 
 }
 
 # This is function is called by convention in PowerShell
 function prompt_ { 
    # our theme 
    $cdelim = [ConsoleColor]::DarkCyan 
    $chost = [ConsoleColor]::Green 
    $cloc = [ConsoleColor]::Cyan 
 
    write-host "$([char]0x3BB) " -n -f $cloc 
    write-host ([net.dns]::GetHostName()) -n -f $chost 
    write-host ' {' -n -f $cdelim 
    write-host (shortenpath (Get-Location).Path) -n -f $cloc 
    write-host '}' -n -f $cdelim 
 
    $global:GitStatus = Get-GitStatus
    Write-GitStatus $GitStatus
 
    return '> '
 }