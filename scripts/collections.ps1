function HashMap {
    [CmdletBinding()]
        param (

        [Parameter(Position=0, Mandatory=$true)]
        [String]
        $type1,

        [Parameter(Position=1, Mandatory=$true)]
        [String]
        $type2
    )

    $string = 'System.Collections.Generic.Dictionary[' + $type1 + ',' + $type2 + ']'

     return New-Object -TypeName $string
    
    }

function List {
    [CmdletBinding()]
        param (

        [Parameter(Position=0, Mandatory=$true)]
        [String]
        $type

    )

    $string = 'System.Collections.Generic.List[' + $type + ']'

        return New-Object -TypeName $string 
    
}
