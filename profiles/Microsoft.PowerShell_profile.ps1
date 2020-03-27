if ($Host.Name -eq 'ConsoleHost') {
    # Inside VSCode Enviornment 
    Write-Host "Loading Console"

    $PSRoot = "$env:USERPROFILE\Google Drive\Programming\Powershell\GitHub"
    . "$PSRoot\profiles\Profile.ps1"

}

elseif ($Host.Name -eq 'Visual Studio Code Host') { 
    # Inside VSCode Enviornment 
    Write-Host "Loading VSCode"
}