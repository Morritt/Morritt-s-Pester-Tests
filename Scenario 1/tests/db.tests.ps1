Param (
    [Parameter(Mandatory)]
    [string] $ConfigFile
)

BeforeDiscovery {
    $config = Get-Content -Path $ConfigFile | ConvertFrom-Json
}

Describe "Database Tests for $ConfigFile" {
    Context "Config Tests" -ForEach $config.db {
        It "Should have a valid connection string" {
            $connectionString = $_.url
            $connectionString | Should -BeLike "mongodb://*:27017"
        }
    }
}