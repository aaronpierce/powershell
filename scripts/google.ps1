function google {

    [CmdletBinding()]
    Param(
    	[Parameter(Mandatory=$True,Position=0)]
    	[String]$SearchFor,
    	
    	[Parameter(Mandatory=$False,Position=1)]
    	[String]$Use = "Google"
    )

    $ErrorActionPreference = "SilentlyContinue"
    If ($Error) {$Error.Clear()}

    $SearchFor = $SearchFor.Trim()
    If (!($SearchFor)) {
    	Write-Host
    	Write-Host "Text That You Wish To Search For Has Not Been Entered." -ForeGroundColor "Yellow"
    	Write-Host "Execution of the Script Has been Ternimated." -ForeGroundColor "Yellow"
    	Write-Host
    	Exit
    }

    $SearchFor = $SearchFor -Replace "\s+", " "
    $SearchFor = $SearchFor -Replace " ", "+"

   	Start-Process "https://www.google.com/search?q=$SearchFor"

}