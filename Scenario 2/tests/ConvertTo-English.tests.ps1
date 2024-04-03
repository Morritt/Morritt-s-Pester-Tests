Describe "ConvertTo-English" {
    Context "ConvertTo-English" {
        It "Should fix 'Yo mama' jokes" {
            $result = ConvertTo-English -Text "Yo mama is so fat"
            $result | Should -Be "Your Mother is so fat"
        }

        It "Should not fix other jokes" {
            $result = ConvertTo-English -Text "Yo mam is so fat"
            $result | Should -Be "Yo mam is so fat"
        }

        It "Should have a mandatory parameter" {
            { ConvertTo-English $null } | Should -Throw
        }
    }
}