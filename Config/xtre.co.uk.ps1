$dnsConfiguration = @(
    @{
        "ZoneName" = "xtre.co.uk"
        "DnsEntries" = @(
            @{
                "type" = "CNAME"
                "name" = "geolocation.xtre.co.uk"
                "content" = "xtremeidiotsgeolocation-live.b6daqqmr6n.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
            @{
                "type" = "CNAME"
                "name" = "geolocation-test.xtre.co.uk"
                "content" = "xtremeidiotsgeolocation-test.b6daqqmr6n.us-east-2.elasticbeanstalk.com"
                "ttl" = 1
                "proxied" = $true
            }
        )
    }
)