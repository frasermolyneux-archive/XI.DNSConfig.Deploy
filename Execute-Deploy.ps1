param (
    [Parameter(Mandatory = $true)] [String] $DeployScriptsPath,
    [Parameter(Mandatory = $true)] [String] $CloudflareAuthKey,
    [Parameter(Mandatory = $true)] [String] $CloudflareEmail,
    [Parameter(Mandatory = $true)] [String] $ZoneToDeploy
)

$DebugPreference = "Continue"
$InformationPreference = "Continue"
$ErrorActionPreference = "Continue"
$WarningPreference = "Continue"
$ErrorActionPreference = "Stop"

. "$DeployScriptsPath\Import-DeployScripts.ps1"

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

if ((Test-Path -Path "$PSScriptRoot\Config\$ZoneToDeploy.ps1") -eq $false) {
    Write-Error "The specified zone $ZoneToDeploy does not have a config file"
    return
}

. "$PSScriptRoot\Config\$ZoneToDeploy.ps1"

$dnsZones = Get-CloudflareDnsZones `
    -AuthKey $CloudflareAuthKey `
    -AuthEmail $CloudflareEmail

$dnsConfiguration | ForEach-Object {
    $zoneName = $_.ZoneName
    $expectedDnsEntries = $_.DnsEntries

    Write-Information "Processing expected domain $zoneName"

    $zone = $dnsZones | Where-Object {$_.name -eq $zoneName}

    if ($null -eq $zone) {
        Write-Error "Dns zone doesn't exist for $zoneName - creation not implemented!"
        continue
    }
    
    $actualDnsEntries = Get-CloudflareDnsEntriesForZone `
        -AuthKey $CloudflareAuthKey `
        -AuthEmail $CloudflareEmail `
        -ZoneId $zone.id

    $expectedDnsEntries | ForEach-Object {
        $expectedDnsEntry = $_

        Write-Information "Processing DNS entry [$($expectedDnsEntry.type)] $($expectedDnsEntry.name)"

        if ($expectedDnsEntry.type -eq "TXT") {
            $actualDnsEntry = $actualDnsEntries | Where-Object {$_.type -eq $expectedDnsEntry.type -and $_.name -eq $expectedDnsEntry.name -and $_.content -eq $expectedDnsEntry.content}
        }
        else {
            $actualDnsEntry = $actualDnsEntries | Where-Object {$_.type -eq $expectedDnsEntry.type -and $_.name -eq $expectedDnsEntry.name}
        }
        
        if ($null -eq $actualDnsEntry) {
            Write-Information "DNS entry [$($expectedDnsEntry.type)] $($expectedDnsEntry.name) does not exist in zone $zoneName"

            New-CloudflareDnsEntryForZone `
                -AuthKey $CloudflareAuthKey `
                -AuthEmail $CloudflareEmail `
                -ZoneId $zone.id `
                -DnsEntry $expectedDnsEntry
        }
        else {
            Write-Information "DNS entry exists [$($expectedDnsEntry.type)] $($expectedDnsEntry.name) in zone $zoneName"

            if ((Test-CloudflareDnsEntryMatch -ExpectedDnsEntry $expectedDnsEntry -ActualDnsEntry $actualDnsEntry) -eq $false) {
                Write-Information "DNS entry did not pass validation test - updating"

                Update-CloudflareDnsEntryForZone `
                    -AuthKey $CloudflareAuthKey `
                    -AuthEmail $CloudflareEmail `
                    -ZoneId $zone.id `
                    -DnsRecordId $actualDnsEntry.id `
                    -DnsEntry $expectedDnsEntry
            }
            else {
                Write-Information "DNS entry passed validation tests - nothing more to do"
            }
        }
    }

}