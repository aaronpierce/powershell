# Inside Windows Powershell ISE Enviornment 
if ($Host.Name -eq 'Windows PowerShell ISE Host') {

    $PSRoot = ""
    . "$PSRoot\profiles\Profile.ps1"

}
