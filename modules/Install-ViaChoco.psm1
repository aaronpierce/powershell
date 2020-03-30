function Install-ViaChoco {
    
    # Setup Logging
    $LogDir = "$ModulesPath\log\$env:COMPUTERNAME\"
    
    If (!(test-path $LogDir)) {New-Item $LogDir -ItemType Directory}
    
    $LogFile = "$LogDir\chocolatey_log_$(Get-Date -UFormat "%Y-%m-%d")"
    $AppList = "$ModulesPath\app\apps.txt"

    try {
        choco upgrade all -y -r --no-progress --log-file=$LogFile
    } catch {
        [System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
    
    $AppsToInstall = @(Get-Content $AppList)
    
    foreach ($App in $AppsToInstall) {
        choco install $App -y -r --no-progress --log-file=$LogFile
    }
    
    # Remove log files over 10 days old
    <#
    $limit = (Get-Date).AddDays(-10)
    Get-ChildItem -Path $LogDir | Where-Object { $_.CreationTime -lt $limit } | Remove-Item -Force
    #>
}