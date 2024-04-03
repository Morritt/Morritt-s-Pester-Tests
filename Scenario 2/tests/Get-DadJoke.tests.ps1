Describe "Dad Jokes" {

    
    Context "Get-DadJoke" {
        It "Should return a joke" {

            Mock Invoke-WebRequest {
                return Get-Content -Path "./tests/mocks/Get-DadJoke.json"
            }

            $joke = Get-MumJoke
            $joke | Should -Not -BeNullOrEmpty
            Assert-MockCalled -CommandName Invoke-WebRequest
        }
    }
}