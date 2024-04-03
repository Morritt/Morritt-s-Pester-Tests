Describe "Mum Jokes" {
    Context "Get-MumJoke" {      
        It "Should return a joke" {
            Mock Invoke-WebRequest {
                return Get-Content -Path "./tests/mocks/Get-MumJoke.json"
            }
            $joke = Get-MumJoke
            $joke | Should -Not -BeNullOrEmpty
            Assert-MockCalled -CommandName Invoke-WebRequest
        }

        It "Should still fix up 'Yo Mama' in the mock" {
            Mock Invoke-WebRequest {
                return Get-Content -Path "./tests/mocks/Get-MumJoke.json"
            }
            $joke = Get-MumJoke
            $joke | Should -Be "mocked Your Mother joke here"
            Assert-MockCalled -CommandName Invoke-WebRequest
        }
    }
}