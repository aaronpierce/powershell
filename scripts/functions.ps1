
function datestring {
    param(
        [switch]$delimiter = $false,
        [switch]$time = $false,
        [switch]$timed = $false,
        [switch]$h = $false,
        [switch]$m = $false,
        [switch]$s = $false,
        [switch]$utc = $false
    )


    $dt = [DateTime]::Now
    if ($utc) { $dt = [DateTime]::UTCNow }
    if ($timed) { $time, $delimiter = $true, $true }
    if ($time) { $h, $m, $s = $true, $true, $true }


    $del = ''

    if ($delimiter) { $del = '.'}

    $_date = [String]$dt.year + $del + [String]$dt.month + $del + [String]$dt.day

    $result = $_date

    if ($h) { $result += $del + [String]$dt.hour }
    if ($m) { $result += $del + [String]$dt.minute }
    if ($s) { $result += $del + [String]$dt.second }

    return $result
}