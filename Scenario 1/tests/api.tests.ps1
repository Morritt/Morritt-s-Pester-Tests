Param (
    [Parameter(Mandatory)]
    [string] $ConfigFile
)

BeforeDiscovery {
    $config = Get-Content -Path $ConfigFile | ConvertFrom-Json
}

Describe "API Tests for $ConfigFile" {
    Context "API Tests" -ForEach $config.api {
        It "Should start with https" {
            $url = $_.url
            $url | Should -BeLike "https://*"
        }
    }
}