
function sdate {
    param(
        [switch]$delimiter
    )

    $dt = [DateTime]::Now

    $del = ''

    if ($delimiter) { $del = '.'}

    $_date = [String]$dt.year + $del + [String]$dt.month + $del + [String]$dt.day

    Write-Output $_date
}