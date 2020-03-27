function touch($file) { "" | Out-File $file -Encoding ASCII }

function getip($hostname) { [Net.Dns]::GetHostByName($hostname).AddressList.IPAddressToString } 

function ext($file) { [IO.Path]::GetExtension($file) }

function regex($text, $pattern) { [RegEx]::Matches($text, $pattern).Value}
