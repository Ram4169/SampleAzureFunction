using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

$employees = Get-Content .\MyHttpFunction\database\employees.json | ConvertFrom-Json
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    headers = @{'content-type'='application\json'}
    StatusCode = [HttpStatusCode]::OK
    Body = $employees
})
Write-Host $employees.employees
