# Inside Console Enviornment 
if ($Host.Name -eq 'ConsoleHost') {

    $PSRoot = "$env:USERPROFILE\Google Drive\Programming\Powershell\GitHub"
    . "$PSRoot\profiles\Profile.ps1"

}
# Inside VSCode Enviornment 
elseif ($Host.Name -eq 'Visual Studio Code Host') { 

}