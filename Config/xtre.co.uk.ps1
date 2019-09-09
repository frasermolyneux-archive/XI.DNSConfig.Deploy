$dnsConfiguration = @(
    @{
        "ZoneName" = "xtre.co.uk"
        "DnsEntries" = @(
            @{
                "type" = "CNAME"
                "name" = "geolocation.xtre.co.uk"
                "content" = "d1x7blmkkj.execute-api.us-east-2.amazonaws.com"
                "ttl" = 1
                "proxied" = $true
            }
        )
    }
)