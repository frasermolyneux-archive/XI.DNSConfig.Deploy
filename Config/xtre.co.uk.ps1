$dnsConfiguration = @(
    @{
        "ZoneName" = "xtremeidiots.net"
        "DnsEntries" = @(
            @{
                "type" = "CNAME"
                "name" = "geolocation.xtre.co.uk"
                "content" = "geolocation-prd.2iwteg8pdg.us-east-2.elasticbeanstalk.com"
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