
Import-Module .\src\Get-Jokes.psm1

$configuration = [PesterConfiguration]@{
    Run    = @{
        Path = './tests'
        Include = '*.tests.ps1'
    }
    Should = @{
        ErrorAction = 'Continue'
    }
    Output = @{
        Verbosity = 'Detailed'
    }
}

Invoke-Pester -Configuration $configuration