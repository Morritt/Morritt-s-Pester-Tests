Function Get-DadJoke {
    [CmdletBinding()]
    param ()
    
    process {
        $response = Invoke-WebRequest -Uri https://icanhazdadjoke.com/ -Headers @{ Accept = 'application/json' } | ConvertFrom-Json | Select-Object -ExpandProperty joke

        return $response
    }
    
}