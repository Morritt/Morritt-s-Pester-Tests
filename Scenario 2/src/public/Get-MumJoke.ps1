Function Get-MumJoke {
    [CmdletBinding()]
    param ()
    
    process {
        $response = Invoke-WebRequest -Uri 'https://www.yomama-jokes.com/api/v1/jokes/random/' -Headers @{ Accept = 'application/json' } | ConvertFrom-Json | Select-Object -ExpandProperty joke

        return (ConvertTo-English -Text $response)
    }
    
}