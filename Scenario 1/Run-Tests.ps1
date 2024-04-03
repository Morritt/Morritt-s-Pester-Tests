
$containers = @()

foreach ($testFile in (Get-ChildItem -Path './tests' -Filter '*.tests.ps1' ).FullName) {
    foreach ($config in (Get-ChildItem -Path './infra/config' -Filter '*.json').FullName) {
        $containers += New-PesterContainer -Path $testFile -Data @{ ConfigFile = $config }
    }    
}

$configuration = [PesterConfiguration]@{
    Run    = @{
        Container = $containers
    }
    Should = @{
        ErrorAction = 'Continue'
    }
    Output = @{
        Verbosity = 'Detailed'
    }
}

Invoke-Pester -Configuration $configuration