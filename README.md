![Image](https://upload.wikimedia.org/wikipedia/commons/2/2f/PowerShell_5.0_icon.png)

  

# PowerShell

  

PowerShell scripts and modules I use personally. 

If the scripts/modules themselves are not that useful to you, I still hope to provide a great template for deploying your own scripts/modules across your various machines that can be utilized.
  

## Details

 

|Folder |Usage   |
|:-:|:-:|
| profiles  | 	User profiles for loading the modules/scripts/prompts into the PowerShell environment.  |
| modules  	|	Collection of .psm1 files that will be imported in as modules. |
| scripts   |   Collection of .ps1 files that will be dot sourced in. |
| prompts   |  	Any .ps1 file here containing a `prompt` function will be dot sourced in. |
| themes	|	Themes for ISE editor. Not necessary but nice to have.|
  
  

## Deploying Into Your Enviornment

  

The simplest way to put these files into immediate use!

 
Clone this repo with git: 
```powershell
git clone https:\\github.com\aaronwpierce\powershell
```
Then run `deploy.ps1` from within it's location.

This process will move both  `Microsoft.PowerShellISE_profile.ps1` and `Microsoft.PowerShell_profile.ps1` into the directory where your PowerShell profiles are found by default. 

(Ex. `C:\Users\<user>\Documents\WindowsPowershell\<files>`)

These two profile scripts simply redirect to the profile script inside the folder that you cloned with git from this repo.

Be aware doing this will remove any modifications you've made to the existing profile scripts in that folder with those names prior to running this so be sure backup those files if that is a concern.