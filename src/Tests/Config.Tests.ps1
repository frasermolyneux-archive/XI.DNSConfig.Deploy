param (
    [Parameter(Mandatory=$true)] [String] $ModuleRoot
)

Describe "Config Tests" {
    Context "Config Structure" {
        It "should not be empty" {
            (Get-ChildItem "$ModuleRoot\Config" -File).Count | Should Not Be 0
        }
    }

    Get-ChildItem -Path "$ModuleRoot\Config" -Filter "*.ps1" | ForEach-Object {
        
        $file = $_

        Context "$($file.Name)" {

            It "$($file.Name) is valid Powershell code" {
                $psFile = Get-Content -Path "$($file.FullName)" -ErrorAction Stop
                $errors = $null
                $null = [System.Management.Automation.PSParser]::Tokenize($psFile, [ref]$errors)
                if ($errors.Count -gt 0) {
                    Write-Host $errors.Message
                }
                $errors.Count | Should Be 0
            } 

        }

    }

}