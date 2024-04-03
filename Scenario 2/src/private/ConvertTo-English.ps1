function ConvertTo-English {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Text
    )
    
    process {
        return $text -replace "Yo mama", "Your Mother"
    }
}