function map
{
    param(
        [Parameter(Mandatory=$true,Position=0)]
        [scriptblock]
        $Function,
        [Parameter(Mandatory=$true,Position=1)]
        [Object[]]
        $InputObject
    )

    if($Function.Ast.ParamBlock -eq $null)
    {
        $Function = [scriptblock]::Create('param($_)'+$Function.ToString())
    }
    elseif($Function.Ast.ParamBlock.Parameters.Count -eq 1)
    {
        if($Function.Ast.ParamBlock.Parameters[0].Name.ToString() -ne '$_')
        {
            Write-Error "Invalid ParamBlock in Function"
            return $false
        }
    }
    else
    {
        Write-Error "Invalid ParamBlock in Function"
        return $false
    }

    foreach($obj in $InputObject)
    {
        &$Function $obj
    }
}